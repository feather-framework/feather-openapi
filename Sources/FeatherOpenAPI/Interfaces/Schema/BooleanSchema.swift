import OpenAPIKit

public protocol BooleanSchema: Schema {
    static var defaultValue: Bool { get }
}

extension BooleanSchema {
    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .boolean(
            description: description,
            defaultValue: .init(defaultValue)
        )
    }
}
