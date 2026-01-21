//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct RequestBodyID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol RequestBodyRepresentable {
    func openAPIRequestBody() -> OpenAPI.Request
}

public struct RequestBody: RequestBodyRepresentable {

    public var description: String?
    public var content:
        OrderedDictionary<OpenAPI.ContentType, ContentRepresentable>
    public var required: Bool
    public var vendorExtensions: [String: AnyCodable]

    public init(
        description: String? = nil,
        content: OrderedDictionary<OpenAPI.ContentType, ContentRepresentable>,
        required: Bool = false,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.description = description
        self.content = content
        self.required = required
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: description,
            content: content.mapValues { $0.openAPIContent() },
            required: required,
            vendorExtensions: vendorExtensions
        )
    }
}
