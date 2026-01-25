//
//  AllowedValuesProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Provides allowed values for schemas.
public protocol AllowedValuesProperty {
    /// The associated allowed value type.
    associatedtype AllowedValuesPropertyType = AnyCodable

    /// Allowed values for the schema.
    var allowedValues: [AllowedValuesPropertyType]? { get }
}

extension AllowedValuesProperty {
    /// Default allowed values are `nil`.
    public var allowedValues: [AllowedValuesPropertyType]? { nil }
}
