//
//  RequiredProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

public protocol RequiredProperty {
    /// Indicates whether the item is required.
    var required: Bool { get }
}

extension RequiredProperty {
    /// Default required value is `true`.
    public var required: Bool { true }
}
