//
//  ExampleMissingParentItemModel+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

import FeatherOpenAPI

extension ExampleMissingParentItem.Model {

    struct IdSchema: StringSchemaRepresentable {
        var description: String? { "Unique example model identifier" }
    }

    struct KeySchema: StringSchemaRepresentable {
        var description: String? { "Key of the example model" }
        var example: String? { "my-example-key" }
    }
}
