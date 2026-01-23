//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIServerRepresentable {
    func openAPIServer() -> OpenAPI.Server
}

extension OpenAPI.Server: OpenAPIServerRepresentable {
    
    public func openAPIServer() -> OpenAPI.Server {
        self
    }
}
