import OpenAPIKit30

public protocol PasswordSchema: Schema {
    static var example: String? { get }
}

extension PasswordSchema {
    public static func openAPISchema() -> JSONSchema {
        .string(
            format: .password,
            required: true,
            description: description,
            example: example.map { .init($0) }
        )
    }
}
