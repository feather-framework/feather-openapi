import OpenAPIKit30

public protocol DateTimeSchema: Schema {
    static var example: String { get }
}

extension DateTimeSchema {
    public static var examples: [String] { ["2023-04-04T09:20:15.000Z"] }

    public static func openAPISchema() -> JSONSchema {
        .string(
            format: .dateTime,
            description: description,
            example: .init(stringLiteral: example)
        )
    }
}
