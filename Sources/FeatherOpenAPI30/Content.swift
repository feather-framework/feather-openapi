//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ContentRepresentable {
    func openAPIContent() -> OpenAPI.Content
}

public struct Content: ContentRepresentable {

    public var schema: SchemaID
    public var example: AnyCodable?

    public init(
        schema: SchemaID,
        example: AnyCodable? = nil
    ) {
        self.schema = schema
        self.example = example
    }

    public func openAPIContent() -> OpenAPI.Content {
        .init(
            schemaReference: .component(named: schema.rawValue),
            example: example,
            encoding: [:],
            vendorExtensions: [:]
        )
    }
}

//
//
//public typealias Map = OrderedDictionary<OpenAPI.ContentType, OpenAPI.Content>
