//
//  DeprecatedProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

/// Provides a deprecated flag with a default value.
public protocol DeprecatedProperty {
    /// Indicates whether the item is deprecated.
    var deprecated: Bool { get }
}

extension DeprecatedProperty {
    /// Default deprecated value is `false`.
    public var deprecated: Bool { false }
}
