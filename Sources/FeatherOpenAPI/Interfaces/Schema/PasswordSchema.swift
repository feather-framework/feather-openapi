import OpenAPIKit

public protocol PasswordSchema: Schema {
    static var examples: [String] { get }
}

extension PasswordSchema {
    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .string(
            format: .password,
            required: true,
            description: description,
            examples: examples.map { .init($0) }
        )
    }
}
