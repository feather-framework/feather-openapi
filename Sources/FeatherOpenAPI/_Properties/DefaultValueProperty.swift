//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol DefaultValueProperty {
    associatedtype DefaultValuePropertyType = AnyCodable
    
    var defaultValue: DefaultValuePropertyType? { get }
}

public extension DefaultValueProperty {
    var defaultValue: DefaultValuePropertyType? { nil }
}
