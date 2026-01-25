//
//  OpenAPIVariableRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI server variable.
public protocol OpenAPIVariableRepresentable {
    /// Returns the OpenAPI server variable representation.
    /// - Returns: The OpenAPI server variable.
    func openAPIServerVariable() -> OpenAPI.Server.Variable
}

extension OpenAPI.Server.Variable: OpenAPIVariableRepresentable {

    /// Returns `self` as an OpenAPI server variable.
    /// - Returns: The current server variable value.
    public func openAPIServerVariable() -> OpenAPI.Server.Variable {
        self
    }
}
