//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol ExampleProperty {
    associatedtype ExamplePropertyType = AnyCodable
    
    var example: ExamplePropertyType? { get }
}

public extension ExampleProperty {
    var example: ExamplePropertyType? { nil }
}
