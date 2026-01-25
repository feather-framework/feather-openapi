//
//  InfoRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Describes the OpenAPI document info section.
public protocol InfoRepresentable:
    OpenAPIInfoRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    /// Display title of the API.
    var title: String { get }
    /// Terms of service URL.
    var termsOfService: LocationRepresentable? { get }
    /// Contact information for the API.
    var contact: OpenAPIContactRepresentable? { get }
    /// License information for the API.
    var license: OpenAPILicenseRepresentable? { get }
    /// Version string for the API.
    var version: String { get }
}

extension InfoRepresentable {

    /// Default terms of service is `nil`.
    public var termsOfService: LocationRepresentable? { nil }
    /// Default contact is `nil`.
    public var contact: OpenAPIContactRepresentable? { nil }
    /// Default license is `nil`.
    public var license: OpenAPILicenseRepresentable? { nil }

    /// Builds an OpenAPI document info object.
    /// - Returns: The OpenAPI info.
    public func openAPIInfo() -> OpenAPI.Document.Info {
        .init(
            title: title,
            description: description,
            termsOfService: termsOfService?.openAPILocation(),
            contact: contact.map { $0.openAPIContact() },
            license: license.map { $0.openAPILicense() },
            version: version,
            vendorExtensions: vendorExtensions
        )
    }
}
