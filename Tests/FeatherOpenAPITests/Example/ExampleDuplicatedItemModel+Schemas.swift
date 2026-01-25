//
//  ExampleDuplicatedItemModel+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

import FeatherOpenAPI

extension ExampleDuplicatedItem.Model {

    struct IdSchema: StringSchemaRepresentable {
        var description: String? { "Unique example model identifier" }
    }

    struct KeySchema: StringSchemaRepresentable {
        var description: String? { "Key of the example model" }
        var example: String? { "my-example-key" }
    }

    struct KeySecondSchema: StringSchemaRepresentable {
        var openAPIIdentifier: String { KeySchema().openAPIIdentifier }
        var description: String? { "Key of the example model" }
        var example: String? { "my-example-key" }
    }
}
