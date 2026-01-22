//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//


// MARK: - description

public protocol RequestBodyPropertyDescription {
    var description: String? { get }
}

public extension RequestBodyPropertyDescription {
    var description: String? { nil }
}

// MARK: - required

public protocol RequestBodyPropertyRequired {
    var required: Bool { get }
}

public extension RequestBodyPropertyRequired {
    var required: Bool { true }
}
