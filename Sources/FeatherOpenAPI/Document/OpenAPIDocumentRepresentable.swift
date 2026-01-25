//
//  OpenAPIDocumentRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI document.
public protocol OpenAPIDocumentRepresentable {
    /// Returns the OpenAPI document representation.
    /// - Returns: The OpenAPI document.
    func openAPIDocument() -> OpenAPI.Document
}

extension OpenAPI.Document: OpenAPIDocumentRepresentable {

    /// Returns `self` as an OpenAPI document.
    /// - Returns: The current document.
    public func openAPIDocument() -> OpenAPI.Document {
        self
    }
}
