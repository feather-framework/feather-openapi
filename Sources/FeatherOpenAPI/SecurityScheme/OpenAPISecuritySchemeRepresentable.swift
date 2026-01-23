//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPISecuritySchemeRepresentable {
    func openAPISecurityScheme() -> OpenAPI.SecurityScheme
}

extension OpenAPI.SecurityScheme: OpenAPISecuritySchemeRepresentable {
    
    public func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        self
    }
}
