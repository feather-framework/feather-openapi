//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ParameterRepresentable:
    OpenAPIParameterRepresentable,
    DescriptionProperty,
    DeprecatedProperty,
    VendorExtensionsProperty
{
    var name: String { get }
    var context: OpenAPI.Parameter.Context { get }
    var schema: OpenAPISchemaRepresentable { get }
    
}

public extension ParameterRepresentable {
    
    func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: name,
            context: context,
            schema: schema.openAPISchema(),
            description: description,
            deprecated: deprecated,
            vendorExtensions: vendorExtensions
        )
    }
}
