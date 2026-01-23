//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30


public protocol OpenAPIComponentsRepresentable {
    func openAPIComponents() -> OpenAPI.Components
}

extension OpenAPI.Components: OpenAPIComponentsRepresentable {

    public func openAPIComponents() -> OpenAPI.Components {
        self
    }
}
