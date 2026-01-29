//
//  Tag+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Tag {

    struct IdSchema: Int64SchemaRepresentable {
        var required: Bool { false }
    }

    struct NameSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct TagSchema: ObjectSchemaRepresentable {
        var openAPIIdentifier: String { "Tag" }
        var propertyMap: SchemaMap {
            [
                "id": IdSchema(),
                "name": NameSchema(),
            ]
        }
    }
}
