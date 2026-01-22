//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

protocol ArraySchemaRepresentable:
    Identifiable,
    OpenAPISchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyDeprecated,
    SchemaPropertyNullable
{
    var items: JSONSchema? { get }
}

extension ArraySchemaRepresentable {

    public func openAPISchema() -> JSONSchema {
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

