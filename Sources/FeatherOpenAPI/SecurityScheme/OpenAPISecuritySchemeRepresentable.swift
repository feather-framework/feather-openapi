//
//  OpenAPISecuritySchemeRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI security scheme.
public protocol OpenAPISecuritySchemeRepresentable {
    /// Returns the OpenAPI security scheme representation.
    /// - Returns: The OpenAPI security scheme.
    func openAPISecurityScheme() -> OpenAPI.SecurityScheme
}

extension OpenAPI.SecurityScheme: OpenAPISecuritySchemeRepresentable {

    /// Returns `self` as an OpenAPI security scheme.
    /// - Returns: The current security scheme value.
    public func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        self
    }
}
