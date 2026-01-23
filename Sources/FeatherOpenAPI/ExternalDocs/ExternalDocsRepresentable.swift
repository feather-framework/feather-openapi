//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//


import OpenAPIKit30

public protocol ExternalDocsRepresentable:
    OpenAPIExternalDocsRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var url: LocationRepresentable { get }
}

public extension ExternalDocsRepresentable {

    func openAPIExternalDocs() -> OpenAPI.ExternalDocumentation {
        .init(
            description: description,
            url: url.openAPILocation(),
            vendorExtensions: vendorExtensions
        )
    }
}
