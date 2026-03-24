//
//  OpenAPIExternalDocsRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

import OpenAPIKit30

/// A type that can produce OpenAPI external documentation.
public protocol OpenAPIExternalDocsRepresentable {
    /// Returns the OpenAPI external documentation.
    /// - Returns: The external documentation.
    func openAPIExternalDocs() -> OpenAPI.ExternalDocumentation
}

extension OpenAPI.ExternalDocumentation: OpenAPIExternalDocsRepresentable {

    /// Returns `self` as OpenAPI external documentation.
    /// - Returns: The current external documentation value.
    public func openAPIExternalDocs() -> OpenAPI.ExternalDocumentation {
        self
    }
}
