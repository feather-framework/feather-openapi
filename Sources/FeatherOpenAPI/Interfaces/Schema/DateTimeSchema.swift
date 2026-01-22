import OpenAPIKit30

public protocol DateTimeSchema: Schema {
    static var example: String? { get }
}

extension DateTimeSchema {
    public static var example: String? { "2026-01-2T09:20:15.000Z" }

    public static func openAPISchema() -> JSONSchema {
        .string(
            format: .dateTime,
            description: description,
            example: example.map { .init(stringLiteral: $0) }
        )
    }
}
