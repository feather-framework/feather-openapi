//
//  OpenAPIHeaderRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI header or reference.
public protocol OpenAPIHeaderRepresentable {
    /// Returns the OpenAPI header representation.
    /// - Returns: An OpenAPI header or reference.
    func openAPIHeader() -> Either<
        JSONReference<OpenAPI.Header>, OpenAPI.Header
    >
}

extension OpenAPI.Header: OpenAPIHeaderRepresentable {

    /// Returns `self` wrapped as an OpenAPI header.
    /// - Returns: An OpenAPI header value.
    public func openAPIHeader() -> Either<
        JSONReference<OpenAPI.Header>, OpenAPI.Header
    > {
        .init(self)
    }
}
