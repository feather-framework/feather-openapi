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
    }

    struct NameSchema: StringSchemaRepresentable {
        var example: String? { "Dogs" }
    }

    struct CategorySchema: ObjectSchemaRepresentable {
        var propertyMap: SchemaMap {
            [
                "id": IdSchema(),
                "name": NameSchema(),
            ]
        }
    }
}
