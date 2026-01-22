//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

protocol Int64SchemaRepresentable:
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
    ExamplePropertyType == Int64,
    DefaultValuePropertyType == Int64,
    AllowedValuesPropertyType == Int64
{
    
}

extension Int64SchemaRepresentable {

    public func openAPISchema() -> JSONSchema {
        .integer(
            format: .int64,
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
