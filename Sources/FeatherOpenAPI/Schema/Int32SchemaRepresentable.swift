//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol Int32SchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty,
    DefaultValueProperty,
    AllowedValuesProperty
where
    ExamplePropertyType == Int32,
    DefaultValuePropertyType == Int32,
    AllowedValuesPropertyType == Int32
{
    
}

public extension Int32SchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        .integer(
            format: .int32,
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
