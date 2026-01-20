import OpenAPIKit

public protocol BinaryResponse: Response {}

public extension BinaryResponse {

    static func openAPIResponse() -> OpenAPI.Response {
        .init(
            summary: nil,
            description: description,
            headers: openAPIHeaderMap(),
            content: openAPIContentMap() + [
                .any: .init(
                    .init(
                        schema: .string(
                            contentMediaType: .other("application/octet-stream")
                        ),
                        examples: nil
                    )
                )
            ],
            links: .init(),
            vendorExtensions: [:]
        )
    }
}
