//
//  TagRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Describes an OpenAPI tag with defaults.
public protocol TagRepresentable:
    OpenAPITagRepresentable,
    Identifiable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    /// Tag display name.
    var name: String { get }
    /// External documentation for the tag.
    var externalDocs: ExternalDocsRepresentable? { get }
}

extension TagRepresentable {

    /// Default external docs is `nil`.
    public var externalDocs: ExternalDocsRepresentable? { nil }

    /// Builds an OpenAPI tag object.
    /// - Returns: The OpenAPI tag.
    public func openAPITag() -> OpenAPI.Tag {
        .init(
            name: name,
            description: description,
            externalDocs: externalDocs?.openAPIExternalDocs(),
            vendorExtensions: vendorExtensions
        )
    }
}
