//
//  JSONResponseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Response with JSON content.
public protocol JSONResponseRepresentable: ResponseRepresentable {
    /// The JSON schema type used in the response content.
    associatedtype SchemaType: SchemaRepresentable

    /// The schema instance for the JSON response.
    var schema: SchemaType { get }
}

extension JSONResponseRepresentable {

    /// Builds a JSON content map from the schema.
    public var contentMap: ContentMap {
        [
            .json: Content(schema)
        ]
    }
}
