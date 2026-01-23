//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol InfoRepresentable:
    OpenAPIInfoRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var title: String { get }
    var termsOfService: LocationRepresentable? { get }
    var contact: OpenAPIContactRepresentable? { get }
    var license: OpenAPILicenseRepresentable? { get }
    var version: String { get }
}

public extension InfoRepresentable {

    var termsOfService: LocationRepresentable? { nil }
    var contact: OpenAPIContactRepresentable? { nil }
    var license: OpenAPILicenseRepresentable? { nil }

    func openAPIInfo() -> OpenAPI.Document.Info {
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
