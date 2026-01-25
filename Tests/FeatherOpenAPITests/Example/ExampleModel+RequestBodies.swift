//
//  ExampleModel+RequestBodies.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

import FeatherOpenAPI

extension Example.Model {

    struct CreateRequestBody: JSONRequestBodyRepresentable {
        var description: String? { "Create example" }
        var schema: SchemaReference<CreateSchema> { CreateSchema().reference() }
    }
}
