//
//  OpenAPIServerRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI server.
public protocol OpenAPIServerRepresentable {
    /// Returns the OpenAPI server representation.
    /// - Returns: The OpenAPI server.
    func openAPIServer() -> OpenAPI.Server
}

extension OpenAPI.Server: OpenAPIServerRepresentable {

    /// Returns `self` as an OpenAPI server.
    /// - Returns: The current server value.
    public func openAPIServer() -> OpenAPI.Server {
        self
    }
}
