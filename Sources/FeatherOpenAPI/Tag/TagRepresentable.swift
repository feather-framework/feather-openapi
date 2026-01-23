//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol TagRepresentable:
    OpenAPITagRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var name: String { get }
    var externalDocs: ExternalDocsRepresentable? { get }
}

extension TagRepresentable {
    
    var externalDocs: ExternalDocsRepresentable? { nil }

    public func openAPITag() -> OpenAPI.Tag {
        .init(
            name: name,
            description: description,
            externalDocs: externalDocs?.openAPIExternalDocs(),
            vendorExtensions: vendorExtensions
        )
    }
}


