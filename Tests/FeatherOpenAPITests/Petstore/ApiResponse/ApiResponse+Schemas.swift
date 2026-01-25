//
//  ApiResponse+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.ApiResponse {

    struct CodeSchema: Int32SchemaRepresentable {
    }

    struct ResponseTypeSchema: StringSchemaRepresentable {
    }

    struct MessageSchema: StringSchemaRepresentable {
    }

    struct ApiResponseSchema: ObjectSchemaRepresentable {
        var propertyMap: SchemaMap {
            [
                "code": CodeSchema(),
                "type": ResponseTypeSchema(),
                "message": MessageSchema(),
            ]
        }
    }
}
