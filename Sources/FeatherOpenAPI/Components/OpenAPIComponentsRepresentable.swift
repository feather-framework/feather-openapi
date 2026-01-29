//
//  OpenAPIComponentsRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce OpenAPI components.
public protocol OpenAPIComponentsRepresentable {
    /// Returns the OpenAPI components representation.
    /// - Returns: The OpenAPI components.
    func openAPIComponents() -> OpenAPI.Components
}

extension OpenAPI.Components: OpenAPIComponentsRepresentable {

    /// Returns `self` as OpenAPI components.
    /// - Returns: The current components value.
    public func openAPIComponents() -> OpenAPI.Components {
        self
    }
}
