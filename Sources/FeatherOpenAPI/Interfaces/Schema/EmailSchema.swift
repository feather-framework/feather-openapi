import OpenAPIKit

public protocol EmailSchema: Schema {
    static var examples: [String] { get }
}

extension EmailSchema {
    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .string(
            format: .email,
            required: true,
            description: description,
            examples: examples.map { .init($0) }
        )
    }
}
