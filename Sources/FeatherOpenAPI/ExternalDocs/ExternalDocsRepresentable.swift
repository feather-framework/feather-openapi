//
//  ExternalDocsRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes external documentation for the API.
public protocol ExternalDocsRepresentable:
    OpenAPIExternalDocsRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    /// The external documentation URL.
    var url: LocationRepresentable { get }
}

extension ExternalDocsRepresentable {

    /// Builds an OpenAPI external documentation object.
    /// - Returns: The OpenAPI external documentation.
    public func openAPIExternalDocs() -> OpenAPI.ExternalDocumentation {
        .init(
            description: description,
            url: url.openAPILocation(),
            vendorExtensions: vendorExtensions
        )
    }
}
