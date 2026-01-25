//
//  NullableProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public protocol NullableProperty {
    /// Indicates whether the schema value may be null.
    var nullable: Bool? { get }
}

extension NullableProperty {
    /// Default nullable value is `nil`.
    public var nullable: Bool? { nil }
}
