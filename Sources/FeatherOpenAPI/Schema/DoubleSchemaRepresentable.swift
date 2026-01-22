//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

protocol DoubleSchemaRepresentable:
    Identifiable,
    OpenAPISchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyDeprecated,
    SchemaPropertyNullable,
    SchemaPropertyExample,
    SchemaPropertyDefaultValue,
    SchemaPropertyAllowedValues
where
    ExamplePropertyType == Double,
    DefaultValuePropertyType == Double,
    AllowedValuesPropertyType == Double
{
    
}

extension DoubleSchemaRepresentable {

    public func openAPISchema() -> JSONSchema {
        .number(
            format: .double,
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
