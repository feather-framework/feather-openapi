//
//  OpenAPIResponseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI response or reference.
public protocol OpenAPIResponseRepresentable {
    /// Returns the OpenAPI response representation.
    /// - Returns: An OpenAPI response or reference.
    func openAPIResponse() -> Either<
        JSONReference<OpenAPI.Response>, OpenAPI.Response
    >
}

extension OpenAPI.Response: OpenAPIResponseRepresentable {

    /// Returns `self` wrapped as an OpenAPI response.
    /// - Returns: An OpenAPI response value.
    public func openAPIResponse() -> Either<
        JSONReference<OpenAPI.Response>, OpenAPI.Response
    > {
        .init(self)
    }
}
