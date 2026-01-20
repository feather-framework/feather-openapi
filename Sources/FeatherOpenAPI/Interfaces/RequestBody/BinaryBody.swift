import OpenAPIKit

public protocol BinaryBody: RequestBody {
    static var contentType: OpenAPI.ContentType { get }
    static var description: String { get }
    static var required: Bool { get }
}

extension BinaryBody {

    public static var required: Bool { true }

    public static func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: description,
            content: [
                contentType: .init(
                    .init(
                        schema: .string(
                            contentMediaType: .other("application/octet-stream")
                        ),
                        examples: nil
                    )
                ),
            ],
            required: required
        )
    }
}
