//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol TagRepresentable:
    OpenAPITagRepresentable,
    Identifiable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var name: String { get }
    var externalDocs: ExternalDocsRepresentable? { get }
}

public extension TagRepresentable {
    
    var externalDocs: ExternalDocsRepresentable? { nil }

    func openAPITag() -> OpenAPI.Tag {
        .init(
            name: name,
            description: description,
            externalDocs: externalDocs?.openAPIExternalDocs(),
            vendorExtensions: vendorExtensions
        )
    }
}

