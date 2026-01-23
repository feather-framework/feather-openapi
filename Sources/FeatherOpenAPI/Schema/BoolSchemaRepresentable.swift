//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol BoolSchemaRepresentable:
    SchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyDeprecated,
    SchemaPropertyNullable,
    SchemaPropertyExample,
    SchemaPropertyDefaultValue
where
    ExamplePropertyType == Bool,
    DefaultValuePropertyType == Bool
{
    
}

public extension BoolSchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        .boolean(
            format: .generic,
            required: required,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: nil,
            externalDocs: nil,
            allowedValues: nil,
            defaultValue: .init(defaultValue),
            example: .init(example)
        )
    }
}

