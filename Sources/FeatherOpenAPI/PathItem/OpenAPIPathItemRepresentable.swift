//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIPathItemRepresentable {
    func openAPIPathItem() -> OpenAPI.PathItem
}

extension OpenAPI.PathItem: OpenAPIPathItemRepresentable {
    
    public func openAPIPathItem() -> OpenAPI.PathItem {
        self
    }
}
