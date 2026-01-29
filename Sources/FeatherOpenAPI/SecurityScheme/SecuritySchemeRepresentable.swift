//
//  SecuritySchemeRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI security scheme.
public protocol SecuritySchemeRepresentable:
    OpenAPISecuritySchemeRepresentable,
    Identifiable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    /// The security scheme type.
    var type: OpenAPI.SecurityScheme.SecurityType { get }
}

extension SecuritySchemeRepresentable {

    /// Builds an OpenAPI security scheme.
    /// - Returns: The OpenAPI security scheme.
    public func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        .init(
            type: type,
            description: description,
            vendorExtensions: vendorExtensions
        )
    }
}
