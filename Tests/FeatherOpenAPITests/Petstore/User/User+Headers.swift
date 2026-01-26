//
//  User+Headers.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.User {

    struct RateLimitHeader: HeaderRepresentable {
        var description: String? { "calls per hour allowed by the user" }
        var schema: any OpenAPISchemaRepresentable {
            RateLimitSchema()
        }
    }

    struct ExpiresAfterHeader: HeaderRepresentable {
        var description: String? { "date in UTC when token expires" }
        var schema: any OpenAPISchemaRepresentable {
            ExpiresAfterSchema()
        }
    }

    struct RateLimitSchema: Int32SchemaRepresentable {
    }

    struct ExpiresAfterSchema: SchemaRepresentable {
        func openAPISchema() -> JSONSchema {
            .string(
                format: .dateTime,
                required: `required`,
                nullable: nullable,
                permissions: nil,
                deprecated: deprecated,
                title: title,
                description: description,
                discriminator: nil,
                externalDocs: nil,
                minLength: nil,
                maxLength: nil,
                pattern: nil,
                allowedValues: nil,
                defaultValue: nil,
                example: nil
            )
        }
    }
}
