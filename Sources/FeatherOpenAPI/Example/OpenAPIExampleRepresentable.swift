//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIExampleRepresentable {
    func openAPIExample() -> OpenAPI.Example
}

extension OpenAPI.Example: OpenAPIExampleRepresentable {

    public func openAPIExample() -> OpenAPI.Example {
        self
    }
}
