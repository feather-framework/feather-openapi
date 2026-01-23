//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

public protocol RequiredProperty {
    var required: Bool { get }
}

public extension RequiredProperty {
    var required: Bool { true }
}
