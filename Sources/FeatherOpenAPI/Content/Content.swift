//
//  Content.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Concrete content wrapper around a schema.
public struct Content<T: SchemaRepresentable>:
    ContentRepresentable
{
    /// The schema for this content.
    public var schema: any SchemaRepresentable {
        _schema
    }

    var _schema: T

    /// Creates content from a schema.
    /// - Parameter schema: The schema to expose.
    public init(_ schema: T) {
        self._schema = schema
    }
}
