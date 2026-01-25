//
//  HeaderRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI header with defaults.
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
    /// The schema describing the header value.
    var schema: OpenAPISchemaRepresentable { get }
}

extension HeaderRepresentable {

    /// Creates a reference wrapper for this header.
    /// - Returns: A header reference.
    public func reference() -> HeaderReference<Self> {
        .init(self)
    }

    /// Builds an OpenAPI header object or reference.
    /// - Returns: The OpenAPI header representation.
    public func openAPIHeader() -> Either<
        JSONReference<OpenAPI.Header>, OpenAPI.Header
    > {
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

    /// Referenced schemas used by the header.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        guard let schema = schema as? SchemaRepresentable else {
            return [:]
        }
        return schema.allReferencedSchemaMap()
    }
}
