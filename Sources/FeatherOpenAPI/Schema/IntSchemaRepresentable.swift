//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol IntSchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty,
    DefaultValueProperty,
    AllowedValuesProperty
where
    ExamplePropertyType == Int,
    DefaultValuePropertyType == Int,
    AllowedValuesPropertyType == Int
{
    
}

public extension IntSchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        .integer(
            format: .unspecified,
            required: `required`,
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
