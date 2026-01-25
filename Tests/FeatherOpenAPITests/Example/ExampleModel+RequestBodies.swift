//
//  ExampleModel+RequestBodies.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    struct CreateRequestBody: JSONRequestBodyRepresentable {
        var description: String? { "Create example" }
        var schema: SchemaReference<CreateSchema> { CreateSchema().reference() }
    }
}
