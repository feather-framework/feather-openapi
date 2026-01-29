//
//  OpenAPIOperationRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI operation.
public protocol OpenAPIOperationRepresentable {
    /// Returns the OpenAPI operation representation.
    /// - Returns: The OpenAPI operation.
    func openAPIOperation() -> OpenAPI.Operation
}

extension OpenAPI.Operation: OpenAPIOperationRepresentable {

    /// Returns `self` as an OpenAPI operation.
    /// - Returns: The current operation value.
    public func openAPIOperation() -> OpenAPI.Operation {
        self
    }
}
