//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol FloatSchemaRepresentable:
    SchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyDeprecated,
    SchemaPropertyNullable,
    SchemaPropertyExample,
    SchemaPropertyDefaultValue,
    SchemaPropertyAllowedValues
where
    ExamplePropertyType == Float,
    DefaultValuePropertyType == Float,
    AllowedValuesPropertyType == Float
{
    
}

public extension FloatSchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        .number(
            format: .float,
            required: required,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: nil,
            externalDocs: nil,
            multipleOf: nil,
            maximum: nil,
            minimum: nil,
            allowedValues: allowedValues?.map { .init($0) },
            defaultValue: .init(defaultValue),
            example: .init(example)
        )
    }
}

