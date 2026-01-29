//
//  ExampleRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI example with defaults.
public protocol ExampleRepresentable:
    OpenAPIExampleRepresentable,
    Identifiable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    /// Short summary of the example.
    var summary: String? { get }
    /// Example payload value.
    var value: AnyCodable { get }
}

extension ExampleRepresentable {

    /// Creates a reference wrapper for this example.
    /// - Returns: An example reference.
    public func reference() -> ExampleReference<Self> {
        .init(self)
    }

    /// Builds an OpenAPI example object or reference.
    /// - Returns: The OpenAPI example representation.
    public func openAPIExample() -> Either<
        JSONReference<OpenAPI.Example>, OpenAPI.Example
    > {
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
