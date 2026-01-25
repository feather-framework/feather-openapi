//
//  DefaultValueProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Provides a default value for schemas.
public protocol DefaultValueProperty {
    /// The associated default value type.
    associatedtype DefaultValuePropertyType = AnyCodable

    /// The default value.
    var defaultValue: DefaultValuePropertyType? { get }
}

extension DefaultValueProperty {
    /// Default default value is `nil`.
    public var defaultValue: DefaultValuePropertyType? { nil }
}
