//
//  ContentRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Describes OpenAPI content with a schema.
public protocol ContentRepresentable:
    OpenAPIContentRepresentable,
    ReferencedSchemaMapRepresentable,
    VendorExtensionsProperty
{
    /// The schema for the content.
    var schema: SchemaRepresentable { get }
}

extension ContentRepresentable {

    /// Builds an OpenAPI content object.
    /// - Returns: The OpenAPI content.
    public func openAPIContent() -> OpenAPI.Content {
        .init(
            schema: schema.openAPISchema(),
            examples: nil,
            encoding: nil,
            vendorExtensions: vendorExtensions
        )
    }

    /// Referenced schemas for this content.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        schema.allReferencedSchemaMap()
    }
}
