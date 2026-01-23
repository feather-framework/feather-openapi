//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public protocol DescriptionProperty {
    var description: String? { get }
}

public extension DescriptionProperty {
    var description: String? { nil }
}
