//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct HeaderID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol HeaderRepresentable {
    func openAPIHeader() -> OpenAPI.Header
}

extension OpenAPI.Header: HeaderRepresentable {

    public func openAPIHeader() -> OpenAPI.Header {
        self
    }
}

// MARK: -

public struct Header: HeaderRepresentable {

    public var schema: SchemaID
    public var description: String?
    public var required: Bool
    public var deprecated: Bool
    public var vendorExtensions: [String: AnyCodable]

    public init(
        schema: SchemaID,
        description: String? = nil,
        required: Bool = false,
        deprecated: Bool = false,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.schema = schema
        self.description = description
        self.required = required
        self.deprecated = deprecated
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIHeader() -> OpenAPI.Header {
        .init(
            schemaReference: .component(named: schema.rawValue),
            description: description,
            required: required,
            deprecated: deprecated,
            vendorExtensions: vendorExtensions
        )
    }
}
