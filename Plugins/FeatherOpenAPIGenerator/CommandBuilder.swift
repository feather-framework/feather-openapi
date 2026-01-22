//
//  CommandBuilder.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 20..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

import PackagePlugin

struct CommandBuilder {

    func createBuildCommands(
        pluginWorkDirectoryURL: URL,
        tool: (String) throws -> PluginContext.Tool,
        sourceFiles: FileList,
        targetName: String
    ) throws -> [Command] {
        let sourceDir = longestCommonFolderPath(
            sourceFiles.map { $0.url.path() }
        )
        let output = pluginWorkDirectoryURL.appending(
            path: "Component+Generated.swift"
        )

        return [
            .buildCommand(
                displayName: "Generate component extension code",
                executable: try tool("feather-openapikit-generator").url,
                arguments: [sourceDir, output.path(), targetName],
                environment: [:],
                inputFiles: [],
                outputFiles: [output]
            )
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
