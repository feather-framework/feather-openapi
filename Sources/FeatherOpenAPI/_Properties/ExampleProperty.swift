//
//  ExampleProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Provides an example value for schemas.
public protocol ExampleProperty {
    /// The associated example value type.
    associatedtype ExamplePropertyType = AnyCodable

    /// The example value.
    var example: ExamplePropertyType? { get }
}

extension ExampleProperty {
    /// Default example value is `nil`.
    public var example: ExamplePropertyType? { nil }
}
