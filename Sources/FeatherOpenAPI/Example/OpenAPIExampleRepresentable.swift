//
//  OpenAPIExampleRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI example or reference.
public protocol OpenAPIExampleRepresentable {
    /// Returns the OpenAPI example representation.
    /// - Returns: An OpenAPI example or reference.
    func openAPIExample() -> Either<
        JSONReference<OpenAPI.Example>, OpenAPI.Example
    >
}

extension OpenAPI.Example: OpenAPIExampleRepresentable {

    /// Returns `self` wrapped as an OpenAPI example.
    /// - Returns: An OpenAPI example value.
    public func openAPIExample() -> Either<
        JSONReference<OpenAPI.Example>, OpenAPI.Example
    > {
        .init(self)
    }
}
