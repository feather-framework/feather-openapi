//
//  ContactRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI contact.
public protocol ContactRepresentable:
    OpenAPIContactRepresentable,
    VendorExtensionsProperty
{
    /// Contact name.
    var name: String? { get }
    /// Contact URL.
    var url: LocationRepresentable? { get }
    /// Contact email.
    var email: String? { get }
}

extension ContactRepresentable {

    /// Default name is `nil`.
    public var name: String? { nil }
    /// Default URL is `nil`.
    public var url: LocationRepresentable? { nil }
    /// Default email is `nil`.
    public var email: String? { nil }

    /// Builds an OpenAPI contact object.
    /// - Returns: The OpenAPI contact.
    public func openAPIContact() -> OpenAPI.Document.Info.Contact {
        .init(
            name: name,
            url: url?.openAPILocation(),
            email: email,
            vendorExtensions: vendorExtensions
        )
    }
}
