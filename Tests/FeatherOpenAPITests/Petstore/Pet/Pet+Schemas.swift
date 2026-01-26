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
        var required: Bool { false }
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
        var items: SchemaRepresentable? { Petstore.Tag.TagSchema().reference() }
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
        var required: Bool { false }
    }

    struct PetSchema: ObjectSchemaRepresentable {
        var openAPIIdentifier: String { "Pet" }
        var propertyMap: SchemaMap {
            [
                "id": IdSchema(),
                "name": NameSchema(),
                "category": Petstore.Category.CategorySchema()
                    .reference(required: false),
                "photoUrls": PhotoUrlsSchema(),
                "tags": TagsSchema(),
                "status": StatusSchema(),
            ]
        }
    }

    struct PetListSchema: ArraySchemaRepresentable {
        var items: SchemaRepresentable? { PetSchema().reference() }
    }

    struct StatusQuerySchema: StringSchemaRepresentable {
        var defaultValue: String? { "available" }
        var allowedValues: [String]? {
            [
                "available",
                "pending",
                "sold",
            ]
        }
    }

    struct TagsQueryItemSchema: StringSchemaRepresentable {
    }

    struct TagsQuerySchema: ArraySchemaRepresentable {
        var items: SchemaRepresentable? { TagsQueryItemSchema() }
    }

    struct UpdateNameSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct UpdateStatusSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct AdditionalMetadataSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct ApiKeySchema: StringSchemaRepresentable {
        var required: Bool { false }
    }
}
