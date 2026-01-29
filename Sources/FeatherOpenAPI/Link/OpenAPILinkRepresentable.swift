//
//  OpenAPILinkRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI link.
public protocol OpenAPILinkRepresentable {
    /// Returns the OpenAPI link representation.
    /// - Returns: The OpenAPI link.
    func openAPILink() -> OpenAPI.Link
}

extension OpenAPI.Link: OpenAPILinkRepresentable {

    /// Returns `self` as an OpenAPI link.
    /// - Returns: The current link value.
    public func openAPILink() -> OpenAPI.Link {
        self
    }
}
