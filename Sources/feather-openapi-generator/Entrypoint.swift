#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

import SwiftParser
import SwiftSyntax

enum BuilderError: Error {
    case wrongArgumentsNumber
    case invalidOutputFormat
    case errorReadingContent(String)
    case errorAccessContent(String)
}

@main
struct Entrypoint {

    static func main() async throws {
        print("feather-openapi-generator is running...")

        guard CommandLine.arguments.count >= 3 else {
            throw BuilderError.wrongArgumentsNumber
        }

        let input = URL(fileURLWithPath: CommandLine.arguments[1])
        let output = URL(fileURLWithPath: CommandLine.arguments[2])
        let target =
            CommandLine.arguments.count > 3 ? CommandLine.arguments[3] : ""

        let typeCollector = TypeCollector()
        let typeList = try typeCollector.collectTypes(input.path)
        let collectedTypes = typeList.joined(separator: ",\n        ")

        let dateString = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .medium,
            timeStyle: .medium
        )

        let code =
            """
            // generated on: \(dateString)
            \(target == "FeatherOpenAPI" ? "" : "import FeatherOpenAPI")

            extension Component {

                public static func getComponentsOfType<T>() -> [T] {
                    let prefixName = String(reflecting: self) + "."
                    return [
                        \(collectedTypes)
                    ]
                    .compactMap { $0 as? T }.filter {
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

        print("feather-openapi-generator finished.")
    }
}
