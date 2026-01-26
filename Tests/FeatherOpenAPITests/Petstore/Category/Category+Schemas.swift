//
//  Category+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Category {

    struct IdSchema: Int64SchemaRepresentable {
        var example: Int64? { 1 }
        var required: Bool { false }
    }

    struct NameSchema: StringSchemaRepresentable {
        var example: String? { "Dogs" }
        var required: Bool { false }
    }

    struct CategorySchema: ObjectSchemaRepresentable {
        var openAPIIdentifier: String { "Category" }
        var propertyMap: SchemaMap {
            [
                "id": IdSchema(),
                "name": NameSchema(),
            ]
        }
    }
}
