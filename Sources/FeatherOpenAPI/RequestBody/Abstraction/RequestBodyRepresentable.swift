//
//  RequestBodyRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Describes an OpenAPI request body with defaults.
public protocol RequestBodyRepresentable:
    Identifiable,
    OpenAPIRequestBodyRepresentable,
    DescriptionProperty,
    RequiredProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable
{
    /// Map of request body content by content type.
    var contentMap: ContentMap { get }
}

extension RequestBodyRepresentable {

    /// Creates a reference wrapper for this request body.
    /// - Returns: A request body reference.
    public func reference() -> RequestBodyReference<Self> {
        .init(self)
    }

    /// Builds an OpenAPI request body object or reference.
    /// - Returns: The OpenAPI request body representation.
    public func openAPIRequestBody() -> Either<
        JSONReference<OpenAPI.Request>, OpenAPI.Request
    > {
        .init(
            .init(
                description: description,
                content: contentMap.mapValues { $0.openAPIContent() },
                required: `required`,
                vendorExtensions: vendorExtensions
            )
        )
    }

    /// Aggregated referenced schemas from the content map.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        for content in contentMap.values {
            results.merge(content.referencedSchemaMap)
        }
        return results
    }
}
