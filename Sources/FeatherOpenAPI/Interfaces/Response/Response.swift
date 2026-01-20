//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPIResponse: Identifiable {
    static func openAPIResponse() -> OpenAPI.Response
}

public extension OpenAPIResponse {

    static func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Response>,
        OpenAPI.Response
    > {
        .reference(.component(named: id))
    }
}

public protocol Response: OpenAPIResponse {
    static var description: String { get }
    static var headers: [Header.Type] { get }
    static var contents: [OpenAPI.ContentType: Schema.Type] { get }
}

public extension Response {

    static var headers: [Header.Type] { [] }

    static var contents:
        [OpenAPIKit.OpenAPI.ContentType: FeatherOpenAPI.Schema.Type]
    {
        [:]
    }

    static func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: description,
            headers: openAPIHeaderMap(),
            content: openAPIContentMap()
        )
    }

    static func openAPIContentMap() -> OpenAPI.Content.Map {
        var result: OpenAPI.Content.Map = [:]
        for (key, content) in contents {
            result[key] = .init(content.reference())
        }
        return result
    }

    static func openAPIHeaderMap() -> OpenAPI.Header.Map? {
        guard !headers.isEmpty else {
            return nil
        }
        var result: OpenAPI.Header.Map = [:]
        for header in headers {
            result[header.id] = header.reference()
        }
        return result
    }
}
