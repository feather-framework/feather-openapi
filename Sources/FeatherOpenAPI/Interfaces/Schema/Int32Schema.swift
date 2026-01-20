import OpenAPIKit

public protocol Int32Schema: NumberSchema {
    associatedtype T = Int32
}

extension Int32Schema where T == Int32 {

    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .integer(
            format: .int32,
            required: true,
            description: description,

            //TODO: add Int64 cast after openapi kit fixed
            maximum: maximum.map { (Int($0.0), exclusive: $0.exclusive) },
            minimum: maximum.map { (Int($0.0), exclusive: $0.exclusive) },

            defaultValue: defaultValue.map { .init($0) },
            examples: examples.map { .init($0) }
        )
    }
}
