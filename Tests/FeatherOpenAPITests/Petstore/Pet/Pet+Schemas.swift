//
//  Pet+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    struct IdSchema: Int64SchemaRepresentable {
        var example: Int64? { 10 }
    }

    struct NameSchema: StringSchemaRepresentable {
        var example: String? { "doggie" }
    }

    struct PhotoUrlItemSchema: StringSchemaRepresentable {
    }

    struct PhotoUrlsSchema: ArraySchemaRepresentable {
        var items: SchemaRepresentable? { PhotoUrlItemSchema() }
    }

    struct TagsSchema: ArraySchemaRepresentable {
        var required: Bool { false }
        var items: SchemaRepresentable? { Petstore.Tag.TagSchema() }
    }

    struct StatusSchema: StringSchemaRepresentable {
        var description: String? { "pet status in the store" }
        var allowedValues: [String]? {
            [
                "available",
                "pending",
                "sold",
            ]
        }
    }

    struct Schema: ObjectSchemaRepresentable {
        var propertyMap: SchemaMap {
            [
                "id": IdSchema().reference(required: false),
                "name": NameSchema(),
                "category": Petstore.Category.CategorySchema()
                    .reference(required: false),
                "photoUrls": PhotoUrlsSchema(),
                "tags": TagsSchema(),
                "status": StatusSchema().reference(required: false),
            ]
        }
    }
}
