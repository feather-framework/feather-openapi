//
//  OpenAPIRequestBodyRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI request body or reference.
public protocol OpenAPIRequestBodyRepresentable {
    /// Returns the OpenAPI request body representation.
    /// - Returns: An OpenAPI request body or reference.
    func openAPIRequestBody() -> Either<
        JSONReference<OpenAPI.Request>, OpenAPI.Request
    >
}

extension OpenAPI.Request: OpenAPIRequestBodyRepresentable {

    /// Returns `self` wrapped as an OpenAPI request body.
    /// - Returns: An OpenAPI request body value.
    public func openAPIRequestBody() -> Either<
        JSONReference<OpenAPI.Request>, OpenAPI.Request
    > {
        .init(self)
    }
}
