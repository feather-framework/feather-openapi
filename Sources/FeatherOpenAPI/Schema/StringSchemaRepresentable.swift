//
//  StringSchemaRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Schema representation for string values.
public protocol StringSchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty,
    DefaultValueProperty,
    AllowedValuesProperty
where
    ExamplePropertyType == String,
    DefaultValuePropertyType == String,
    AllowedValuesPropertyType == String
{

}

extension StringSchemaRepresentable {

    /// Builds a string JSON schema.
    /// - Returns: The JSON schema.
    public func openAPISchema() -> JSONSchema {
        .string(
            format: .generic,
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
            allowedValues: allowedValues?.map { .init($0) },
            defaultValue: defaultValue.map { .init($0) },
            example: example.map { .init($0) }
        )
    }
}
