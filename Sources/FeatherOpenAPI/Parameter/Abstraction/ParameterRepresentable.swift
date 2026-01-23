//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ParameterRepresentable:
    OpenAPIParameterRepresentable
{
    var name: String { get }
    var context: OpenAPI.Parameter.Context { get }
    var schema: OpenAPISchemaRepresentable { get }
    var description: String? { get }
    var deprecated: Bool { get }
}

public extension ParameterRepresentable {
 
    var description: String? { nil }
    var deprecated: Bool { false }
    
    func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: name,
            context: context,
            schema: schema.openAPISchema(),
            description: description,
            deprecated: deprecated,
            vendorExtensions: [:]
        )
    }
}
