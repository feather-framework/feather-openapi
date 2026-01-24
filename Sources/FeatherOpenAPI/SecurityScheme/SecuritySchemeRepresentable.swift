//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol SecuritySchemeRepresentable:
    OpenAPISecuritySchemeRepresentable,
    Identifiable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var type: OpenAPI.SecurityScheme.SecurityType { get }
}

public extension SecuritySchemeRepresentable {
    
    func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        .init(
            type: type,
            description: description,
            vendorExtensions: vendorExtensions
        )
    }
}
