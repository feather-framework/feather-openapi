//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//


public protocol NullableProperty {
    var nullable: Bool? { get }
}

public extension NullableProperty {
    var nullable: Bool? { nil }
}
