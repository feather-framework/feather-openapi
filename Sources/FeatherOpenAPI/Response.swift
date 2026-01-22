//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct ResponseID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol ResponseRepresentable {
    func openAPIResponse() -> OpenAPI.Response
}

public struct Response: ResponseRepresentable {

    public var description: String
    public var headers: OrderedDictionary<String, HeaderID>
    public var content:
        OrderedDictionary<OpenAPI.ContentType, ContentRepresentable>
    public var vendorExtensions: [String: AnyCodable]

    public init(
        description: String,
        headers: OrderedDictionary<String, HeaderID> = [:],
        content: OrderedDictionary<OpenAPI.ContentType, ContentRepresentable> =
            [:],
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.description = description
        self.headers = headers
        self.content = content
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: description,
            headers: headers.mapValues {
                .init(.component(named: $0.rawValue))
            },
            content: content.mapValues { $0.openAPIContent() },
            links: [:],
            vendorExtensions: vendorExtensions
        )
    }
}
