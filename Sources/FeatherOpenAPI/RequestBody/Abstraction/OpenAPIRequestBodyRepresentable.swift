//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol OpenAPIRequestBodyRepresentable {
    func openAPIRequestBody() -> OpenAPI.Request
}

extension OpenAPI.Request: OpenAPIRequestBodyRepresentable {
    
    public func openAPIRequestBody() -> OpenAPI.Request {
        self
    }
}

