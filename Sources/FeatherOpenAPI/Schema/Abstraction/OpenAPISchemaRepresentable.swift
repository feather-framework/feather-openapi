//
//  OpenAPISchemaRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI JSON schema.
public protocol OpenAPISchemaRepresentable {

    /// Returns the JSON schema representation.
    /// - Returns: The JSON schema.
    func openAPISchema() -> JSONSchema
}

extension JSONSchema: OpenAPISchemaRepresentable {

    /// Returns `self` as a JSON schema.
    /// - Returns: The current schema value.
    public func openAPISchema() -> JSONSchema { self }
}
