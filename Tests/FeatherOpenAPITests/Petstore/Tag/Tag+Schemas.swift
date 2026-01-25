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
    }

    struct NameSchema: StringSchemaRepresentable {
    }

    struct TagSchema: ObjectSchemaRepresentable {
        var propertyMap: SchemaMap {
            [
                "id": IdSchema(),
                "name": NameSchema(),
            ]
        }
    }
}
