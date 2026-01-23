//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public protocol DeprecatedProperty {
    var deprecated: Bool { get }
}

public extension DeprecatedProperty {
    var deprecated: Bool { false }
}
