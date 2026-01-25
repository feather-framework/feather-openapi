//
//  FormRequestBodyRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Request body with form-encoded content.
public protocol FormRequestBodyRepresentable: RequestBodyRepresentable {
    /// The schema type used in the form content.
    associatedtype SchemaType: SchemaRepresentable

    /// The schema instance for the form request body.
    var schema: SchemaType { get }
}

extension FormRequestBodyRepresentable {

    /// Builds a form content map from the schema.
    public var contentMap: ContentMap {
        [
            .form: Content(schema)
        ]
    }
}
