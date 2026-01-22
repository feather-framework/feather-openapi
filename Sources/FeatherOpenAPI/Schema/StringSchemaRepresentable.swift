//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

protocol StringSchemaRepresentable:
    Identifiable,
    OpenAPISchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyNullable,
    SchemaPropertyDeprecated,
    SchemaPropertyExample,
    SchemaPropertyDefaultValue,
    SchemaPropertyAllowedValues
where
    ExamplePropertyType == String,
    DefaultValuePropertyType == String,
    AllowedValuesPropertyType == String
{
    
}

extension StringSchemaRepresentable {

    public func openAPISchema() -> JSONSchema {
        .string(
            format: .generic,
            required: required,
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
            allowedValues: allowedValues?.map { .init($0) },
            defaultValue: .init(defaultValue),
            example: .init(example)
        )
    }
}

