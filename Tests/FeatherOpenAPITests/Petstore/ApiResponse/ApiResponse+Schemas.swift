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
        var required: Bool { false }
    }

    struct ResponseTypeSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct MessageSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct ApiResponseSchema: ObjectSchemaRepresentable {
        var openAPIIdentifier: String { "ApiResponse" }
        var propertyMap: SchemaMap {
            [
                "code": CodeSchema(),
                "type": ResponseTypeSchema(),
                "message": MessageSchema(),
            ]
        }
    }
}
