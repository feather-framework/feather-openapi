import OpenAPIKit30

public protocol IntSchema: NumberSchema {
    associatedtype T = Int
}

extension IntSchema where T == Int {

    public static func openAPISchema() -> JSONSchema {
        .integer(
            format: .unspecified,
            required: true,
            description: description,
            maximum: maximum,
            minimum: minimum,
            defaultValue: defaultValue.map { .init(integerLiteral: $0) },
            example: example.map { .init(integerLiteral: $0) }
        )
    }
}
