//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct ParameterID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol ParameterRepresentable {
    func openAPIParameter() -> OpenAPI.Parameter
}

public struct Parameter: ParameterRepresentable {

    public var name: String
    public var context: OpenAPI.Parameter.Context
    public var schema: SchemaID
    public var description: String?
    public var deprecated: Bool
    public var vendorExtensions: [String: AnyCodable]

    public init(
        name: String,
        context: OpenAPI.Parameter.Context,
        schema: SchemaID,
        description: String? = nil,
        deprecated: Bool = false,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.name = name
        self.context = context
        self.schema = schema
        self.description = description
        self.deprecated = deprecated
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: name,
            context: context,
            schemaReference: .component(named: schema.rawValue),
            description: description,
            deprecated: deprecated,
            vendorExtensions: vendorExtensions
        )
    }
}
