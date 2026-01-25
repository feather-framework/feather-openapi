//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol HeaderRepresentable:
    OpenAPIHeaderRepresentable,
    Identifiable,
    DescriptionProperty,
    RequiredProperty,
    DeprecatedProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable
{
    var schema: OpenAPISchemaRepresentable { get }
}

public extension HeaderRepresentable {
    
    func reference() -> HeaderReference<Self> {
        .init(self)
    }

    func openAPIHeader() -> Either<JSONReference<OpenAPI.Header>, OpenAPI.Header> {
        .init(
            .init(
                schema: schema.openAPISchema(),
                description: description,
                required: required,
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
