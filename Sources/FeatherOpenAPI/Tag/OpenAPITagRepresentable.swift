//
//  OpenAPITagRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI tag.
public protocol OpenAPITagRepresentable {
    /// Returns the OpenAPI tag representation.
    /// - Returns: The OpenAPI tag.
    func openAPITag() -> OpenAPI.Tag
}

extension OpenAPI.Tag: OpenAPITagRepresentable {

    /// Returns `self` as an OpenAPI tag.
    /// - Returns: The current tag value.
    public func openAPITag() -> OpenAPI.Tag {
        self
    }
}
