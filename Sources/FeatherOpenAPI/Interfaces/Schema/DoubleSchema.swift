import OpenAPIKit30

public protocol DoubleSchema: NumberSchema {
    associatedtype T = Double
}

extension DoubleSchema where T == Double {

    public static func openAPISchema() -> JSONSchema {
        .number(
            format: .double,
            required: true,
            description: description,
            maximum: maximum,
            minimum: minimum,
            defaultValue: defaultValue.map { .init($0) },
            example: example.map { .init($0) }
        )
    }
}
