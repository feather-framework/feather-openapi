//
//  LicenseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI license.
public protocol LicenseRepresentable:
    OpenAPILicenseRepresentable,
    VendorExtensionsProperty
{
    /// License name.
    var name: String { get }
    /// License URL.
    var url: LocationRepresentable? { get }
}

extension LicenseRepresentable {

    /// Builds an OpenAPI license object.
    /// - Returns: The OpenAPI license.
    public func openAPILicense() -> OpenAPI.Document.Info.License {
        .init(
            name: name,
            url: url?.openAPILocation(),
            vendorExtensions: vendorExtensions
        )
    }
}
