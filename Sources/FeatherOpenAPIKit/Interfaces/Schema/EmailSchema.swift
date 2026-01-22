import OpenAPIKit30

public protocol EmailSchema: Schema {
    static var example: String? { get }
}

extension EmailSchema {
    public static func openAPISchema() -> JSONSchema {
        .string(
            format: .generic,
            required: true,
            description: description,
            example: example.map { .init($0) }
        )
    }
}
