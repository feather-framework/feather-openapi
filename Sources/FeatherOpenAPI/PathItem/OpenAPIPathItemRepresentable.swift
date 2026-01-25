//
//  OpenAPIPathItemRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI path item.
public protocol OpenAPIPathItemRepresentable {
    /// Returns the OpenAPI path item representation.
    /// - Returns: The OpenAPI path item.
    func openAPIPathItem() -> OpenAPI.PathItem
}

extension OpenAPI.PathItem: OpenAPIPathItemRepresentable {

    /// Returns `self` as an OpenAPI path item.
    /// - Returns: The current path item value.
    public func openAPIPathItem() -> OpenAPI.PathItem {
        self
    }
}
