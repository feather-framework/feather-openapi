//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ParameterRepresentable:
    OpenAPIParameterRepresentable,
    Identifiable,
    // property
    DescriptionProperty,
    DeprecatedProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable
{
    var name: String { get }
    var context: OpenAPI.Parameter.Context { get }
    var schema: OpenAPISchemaRepresentable { get }
    
}

public extension ParameterRepresentable {
    
    func reference() -> ParameterReference<Self> {
        .init(self)
    }
    
    func openAPIParameter() -> Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter> {
        .init(
            .init(
                name: name,
                context: context,
                schema: schema.openAPISchema(),
                description: description,
                deprecated: deprecated,
                vendorExtensions: vendorExtensions
            )
        )
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        guard let schema = schema as? SchemaRepresentable else {
            return [:]
        }
        return schema.allReferencedSchemaMap()
    }
}
