//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol AllowedValuesProperty {
    associatedtype AllowedValuesPropertyType = AnyCodable
    
    var allowedValues: [AllowedValuesPropertyType]? { get }
}

public extension AllowedValuesProperty {
    var allowedValues: [AllowedValuesPropertyType]? { nil }
}
