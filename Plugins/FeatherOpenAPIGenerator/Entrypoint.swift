#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

import PackagePlugin

enum PluginError: Error {
    case noTarget(name: String)
}

@main
struct Entrypoint: BuildToolPlugin {
    
    func createBuildCommands(
        context: PluginContext,
        target: Target
    ) async throws -> [Command] {
        guard let swiftTarget = target as? SwiftSourceModuleTarget else {
            throw PluginError.noTarget(name: target.name)
        }
        let commandBuilder = CommandBuilder()
        return try commandBuilder.createBuildCommands(
            pluginWorkDirectoryURL: context.pluginWorkDirectoryURL,
            tool: context.tool,
            sourceFiles: swiftTarget.sourceFiles,
            targetName: target.name
        )
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension Entrypoint: XcodeBuildToolPlugin {
    
    func createBuildCommands(
        context: XcodePluginContext,
        target: XcodeTarget
    ) throws -> [Command] {
        let commandBuilder = CommandBuilder()
        return try commandBuilder.createBuildCommands(
            pluginWorkDirectoryURL: context.pluginWorkDirectoryURL,
            tool: context.tool,
            sourceFiles: target.inputFiles,
            targetName: target.displayName
        )
    }
}
#endif


struct CommandBuilder {

    func createBuildCommands(
        pluginWorkDirectoryURL: URL,
        tool: (String) throws -> PluginContext.Tool,
        sourceFiles: FileList,
        targetName: String
    ) throws -> [Command] {
        let sourceDir = longestCommonFolderPath(sourceFiles.map { $0.url.path() })
        let output = pluginWorkDirectoryURL.appending(path: "Component+Generated.swift")

        return [
            .buildCommand(
                displayName: "Generate component extension code",
                executable: try tool("feather-openapi-generator").url,
                arguments: [sourceDir, output.path(), targetName],
                environment: [:],
                inputFiles: [],
                outputFiles: [output]
            ),
        ]
    }

    func longestCommonFolderPath(
        _ filePaths: [String]
    ) -> String {
        guard !filePaths.isEmpty else { return "" }

        var commonComponents = filePaths.first!.components(separatedBy: "/")
        commonComponents.removeLast()

        for path in filePaths {
            let components = path.components(separatedBy: "/")
            for i in 0..<min(commonComponents.count, components.count)
            where commonComponents[i] != components[i] {
                commonComponents.removeLast(commonComponents.count - i)
                break
            }
        }

        return commonComponents.joined(separator: "/")
    }
}
