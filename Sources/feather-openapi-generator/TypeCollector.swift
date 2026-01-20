//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 20..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

import SwiftParser
import SwiftSyntax

struct TypeCollector {

    func getFullName(
        _ node: TypeSyntax
    ) -> String {
        node.trimmedDescription
    }

    func getNodeName(
        _ parentNodeName: String,
        _ nodeName: String
    ) -> String {
        if parentNodeName.isEmpty {
            return nodeName
        }
        return parentNodeName + "." + nodeName
    }

    func collectTypes(
        _ parentNodeName: String,
        _ node: SyntaxProtocol
    ) -> [String] {
        var ret: [String] = []

        var members: MemberBlockItemListSyntax?
        var nodeName: String = ""

        if let extensionDecl = node.as(ExtensionDeclSyntax.self) {
            nodeName = getNodeName(
                parentNodeName,
                getFullName(extensionDecl.extendedType)
            )
            members = extensionDecl.memberBlock.members
        }
        else if let enumDecl = node.as(EnumDeclSyntax.self) {
            nodeName = getNodeName(parentNodeName, enumDecl.name.text)
            members = enumDecl.memberBlock.members
            ret.append(nodeName + ".self")
        }
        else if let structDecl = node.as(StructDeclSyntax.self) {
            nodeName = getNodeName(parentNodeName, structDecl.name.text)
            members = structDecl.memberBlock.members
        }
        else if let classDecl = node.as(ClassDeclSyntax.self) {
            nodeName = getNodeName(parentNodeName, classDecl.name.text)
            members = classDecl.memberBlock.members
        }

        if let _ = members {
            for member in members! {
                let list = collectTypes(nodeName, member.decl)
                ret += list
            }
        }

        return ret
    }

    func collectTypes(
        _ root: SourceFileSyntax
    ) -> [String] {
        var ret: [String] = []

        for st in root.statements {
            let list = collectTypes("", st.item)
            ret += list
        }

        return ret
    }

    func collectTypes(
        _ dirPath: String
    ) throws -> [String] {
        var ret: [String] = []

        let fileManager = FileManager.default
        let folderURL = URL(fileURLWithPath: dirPath)

        do {
            let fileURLs = try fileManager.contentsOfDirectory(
                at: folderURL,
                includingPropertiesForKeys: nil,
                options: [.skipsHiddenFiles]
            )

            for fileURL in fileURLs {
                if fileURL.hasDirectoryPath {
                    let list = try collectTypes(fileURL.path)
                    ret += list
                }
                else if fileURL.pathExtension == "swift" {
                    do {
                        let fileContent = try String(
                            contentsOf: fileURL,
                            encoding: .utf8
                        )
                        let list = collectTypes(
                            Parser.parse(source: fileContent)
                        )
                        ret += list
                    }
                    catch {
                        throw BuilderError.errorReadingContent(
                            "Error reading content of \(fileURL.relativePath): \(error)"
                        )
                    }
                }
            }
        }
        catch {
            throw BuilderError.errorAccessContent(
                "Error accessing contents of the folder: \(error)"
            )
        }

        return ret
    }

}
