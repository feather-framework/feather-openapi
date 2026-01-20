import Foundation
import SwiftParser
import SwiftSyntax

enum BuilderError: Error {
    case wrongArgumentsNumber
    case invalidOutputFormat
    case errorReadingContent(String)
    case errorAccessContent(String)
}

@main
struct _Tool {
    static func main() async throws {
        print("FeatherOpenAPIGenerator is running...")

        guard CommandLine.arguments.count >= 3 else {
            throw BuilderError.wrongArgumentsNumber
        }

        let input = URL(fileURLWithPath: CommandLine.arguments[1])
        let output = URL(fileURLWithPath: CommandLine.arguments[2])
        let target =
            CommandLine.arguments.count > 3 ? CommandLine.arguments[3] : ""

        let typeList = try collectTypes(input.path)
        let collectedTypes = typeList.joined(separator: ",\n        ")

        let dateString = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .medium,
            timeStyle: .medium
        )

        let code =
            """
            //generated on: \(dateString)
            \(target == "FeatherOpenAPI" ? "" : "import FeatherOpenAPI")

            extension Component {

                public static func getComponentsOfType<T>() -> [T] {
                    let prefixName = String(reflecting: self) + "."
                    return [
                        \(collectedTypes)
                    ].compactMap { $0 as? T }.filter {
                        String(reflecting: $0).hasPrefix(prefixName)
                    }
                }
            }
            """

        print("Generated code path: \(output.path)")

        guard let data = code.data(using: .utf8) else {
            throw BuilderError.invalidOutputFormat
        }

        try data.write(to: output, options: .atomic)

        print("FeatherOpenAPIGenerator finished.")
    }

    private static func getFullName(_ node: TypeSyntax) -> String {
        node.trimmedDescription
    }

    private static func getNodeName(
        _ parentNodeName: String,
        _ nodeName: String
    ) -> String {
        if parentNodeName.isEmpty {
            return nodeName
        }
        return parentNodeName + "." + nodeName
    }

    private static func collectTypes(
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

    private static func collectTypes(_ root: SourceFileSyntax) -> [String] {
        var ret: [String] = []

        for st in root.statements {
            let list = collectTypes("", st.item)
            ret += list
        }

        return ret
    }

    private static func collectTypes(_ dirPath: String) throws -> [String] {
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
