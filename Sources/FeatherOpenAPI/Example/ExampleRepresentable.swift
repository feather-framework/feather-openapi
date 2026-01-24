//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ExampleRepresentable:
    OpenAPIExampleRepresentable,
    Identifiable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var summary: String? { get }
    var value: AnyCodable { get }
}

public extension ExampleRepresentable {

    func reference() -> ExampleReference<Self> {
        .init(self)
    }
    
    func openAPIExample() -> Either<JSONReference<OpenAPI.Example>, OpenAPI.Example> {
        .init(
            .init(
                summary: summary,
                description: description,
                value: .init(value),
                vendorExtensions: vendorExtensions
            )
        )
    }
}
