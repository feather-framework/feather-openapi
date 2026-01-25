//
//  OpenAPIContentRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// A type that can produce OpenAPI content.
public protocol OpenAPIContentRepresentable {
    /// Returns the OpenAPI content representation.
    /// - Returns: The OpenAPI content.
    func openAPIContent() -> OpenAPI.Content
}

extension OpenAPI.Content: OpenAPIContentRepresentable {

    /// Returns `self` as OpenAPI content.
    /// - Returns: The current content value.
    public func openAPIContent() -> OpenAPI.Content {
        self
    }
}

// MARK: -
