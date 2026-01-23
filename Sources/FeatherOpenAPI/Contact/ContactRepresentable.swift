//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ContactRepresentable:
    OpenAPIContactRepresentable,
    VendorExtensionsProperty
{
    var name: String? { get }
    var url: LocationRepresentable? { get }
    var email: String? { get }
}

public extension ContactRepresentable {
    
    var name: String? { nil }
    var url: LocationRepresentable? { nil }
    var email: String? { nil }
    
    func openAPIContact() -> OpenAPI.Document.Info.Contact {
        .init(
            name: name,
            url: url?.openAPILocation(),
            email: email,
            vendorExtensions: vendorExtensions
        )
    }
}
