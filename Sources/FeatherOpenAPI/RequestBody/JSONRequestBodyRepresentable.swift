//
//  JSONRequestBodyRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Request body with JSON content.
public protocol JSONRequestBodyRepresentable: RequestBodyRepresentable {
    /// The JSON schema type used in the request body.
    associatedtype SchemaType: SchemaRepresentable

    /// The schema instance for the JSON request body.
    var schema: SchemaType { get }
}

extension JSONRequestBodyRepresentable {

    /// Builds a JSON content map from the schema.
    public var contentMap: ContentMap {
        [
            .json: Content(schema)
        ]
    }
}
