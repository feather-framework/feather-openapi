//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol HeaderRepresentable:
    OpenAPIHeaderRepresentable,
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

    func openAPIHeader() -> OpenAPI.Header {
        .init(
            schema: schema.openAPISchema(),
            description: description,
            required: required,
            deprecated: deprecated,
            vendorExtensions: vendorExtensions
        )
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        if let ref = schema as? SchemaReferenceRepresentable {
            results[ref.id] = ref.object
        }
        return results
    }
}
