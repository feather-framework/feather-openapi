//
//  DescriptionProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public protocol DescriptionProperty {
    /// Human-readable description.
    var description: String? { get }
}

extension DescriptionProperty {
    /// Default description is `nil`.
    public var description: String? { nil }
}
