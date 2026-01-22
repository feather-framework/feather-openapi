import OpenAPIKit30

public protocol BooleanSchema: Schema {
    static var defaultValue: Bool? { get }
}

public extension BooleanSchema {
    static var defaultValue: Bool? { nil }
}

extension BooleanSchema {
    public static func openAPISchema() -> JSONSchema {
        .boolean(
            description: description,
            defaultValue: defaultValue.map { .init($0) }
        )
    }
}
