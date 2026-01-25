//
//  FormResponseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Response with form-encoded content.
public protocol FormResponseRepresentable: ResponseRepresentable {
    /// The schema type used in the form content.
    associatedtype SchemaType: SchemaRepresentable

    /// The schema instance for the form response.
    var schema: SchemaType { get }
}

extension FormResponseRepresentable {

    /// Builds a form content map from the schema.
    public var contentMap: ContentMap {
        [
            .form: Content(schema)
        ]
    }
}
