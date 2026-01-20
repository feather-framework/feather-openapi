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
