import OpenAPIKit

public protocol IntSchema: NumberSchema {
    associatedtype T = Int
}

extension IntSchema where T == Int {

    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .integer(
            format: .unspecified,
            required: true,
            description: description,
            maximum: maximum,
            minimum: minimum,
            defaultValue: defaultValue.map { .init(integerLiteral: $0) },
            examples: examples.map { .init(integerLiteral: $0) }
        )
    }
}
