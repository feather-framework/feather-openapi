//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol LicenseRepresentable:
    OpenAPILicenseRepresentable,
    VendorExtensionsProperty
{
    var name: String { get }
    var url: LocationRepresentable? { get }
}

extension LicenseRepresentable {

    public func openAPILicense() -> OpenAPI.Document.Info.License {
        .init(
            name: name,
            url: url?.openAPILocation(),
            vendorExtensions: vendorExtensions
        )
    }
}
