//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol HeaderRepresentable:
    OpenAPIHeaderRepresentable,
    DescriptionProperty,
    RequiredProperty,
    DeprecatedProperty,
    VendorExtensionsProperty
{
    var schema: OpenAPISchemaRepresentable { get }
}

public extension HeaderRepresentable {

    func openAPIHeader() -> OpenAPI.Header {
        .init(
            schema: schema.openAPISchema(),
            description: description,
            required: required,
            deprecated: deprecated,
            vendorExtensions: vendorExtensions
        )
    }
}
