//
//  OpenAPIParameterRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI parameter or reference.
public protocol OpenAPIParameterRepresentable {
    /// Returns the OpenAPI parameter representation.
    /// - Returns: An OpenAPI parameter or reference.
    func openAPIParameter() -> Either<
        JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter
    >
}

extension OpenAPI.Parameter: OpenAPIParameterRepresentable {

    /// Returns `self` wrapped as an OpenAPI parameter.
    /// - Returns: An OpenAPI parameter value.
    public func openAPIParameter() -> Either<
        JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter
    > {
        .init(self)
    }
}
