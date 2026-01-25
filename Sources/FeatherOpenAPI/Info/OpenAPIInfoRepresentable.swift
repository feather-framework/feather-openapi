//
//  OpenAPIInfoRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// A type that can produce OpenAPI document info.
public protocol OpenAPIInfoRepresentable {

    /// Returns the OpenAPI document info representation.
    /// - Returns: The OpenAPI info.
    func openAPIInfo() -> OpenAPI.Document.Info
}

extension OpenAPI.Document.Info: OpenAPIInfoRepresentable {

    /// Returns `self` as OpenAPI document info.
    /// - Returns: The current info value.
    public func openAPIInfo() -> OpenAPI.Document.Info {
        self
    }
}
