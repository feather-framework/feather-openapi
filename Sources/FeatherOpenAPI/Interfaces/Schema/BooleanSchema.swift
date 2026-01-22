import OpenAPIKit30

public protocol BooleanSchema: Schema {
    static var defaultValue: Bool { get }
}

extension BooleanSchema {
    public static func openAPISchema() -> JSONSchema {
        .boolean(
            description: description,
            defaultValue: .init(defaultValue)
        )
    }
}
