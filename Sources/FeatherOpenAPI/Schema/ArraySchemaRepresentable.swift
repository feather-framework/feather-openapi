//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol ArraySchemaRepresentable:
    SchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyDeprecated,
    SchemaPropertyNullable
{
    var items: JSONSchema? { get }
}

public extension ArraySchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        .array(
            format: .generic,
            required: required,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: nil,
            externalDocs: nil,
            minItems: nil,
            maxItems: nil,
            uniqueItems: nil,
            items: items,
            allowedValues: nil,
            defaultValue: nil,
            example: nil
        )
    }
}

