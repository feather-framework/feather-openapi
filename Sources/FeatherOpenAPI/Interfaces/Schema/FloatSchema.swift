import OpenAPIKit

public protocol FloatSchema: NumberSchema {
    associatedtype T = Float
}

extension FloatSchema where T == Float {

    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .number(
            format: .float,
            required: true,
            description: description,
            maximum: maximum.map { (Double($0.0), exclusive: $0.1) },
            minimum: minimum.map { (Double($0.0), exclusive: $0.1) },
            defaultValue: defaultValue.map { .init($0) },
            examples: examples.map { .init($0) }
        )
    }
}
