import OpenAPIKit

public protocol DateTimeSchema: Schema {
    static var examples: [String] { get }
}

extension DateTimeSchema {
    public static var examples: [String] { ["2023-04-04T09:20:15.000Z"] }

    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .string(
            format: .dateTime,
            description: description,
            examples: examples.map { .init(stringLiteral: $0) }
        )
    }
}
