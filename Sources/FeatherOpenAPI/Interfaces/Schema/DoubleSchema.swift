import OpenAPIKit

public protocol DoubleSchema: NumberSchema {
    associatedtype T = Double
}

extension DoubleSchema where T == Double {

    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .number(
            format: .double,
            required: true,
            description: description,
            maximum: maximum,
            minimum: minimum,
            defaultValue: defaultValue.map { .init($0) },
            examples: examples.map { .init($0) }
        )
    }
}
