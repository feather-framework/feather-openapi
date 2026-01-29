//
//  BoolSchemaRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Schema representation for boolean values.
public protocol BoolSchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty,
    DefaultValueProperty
where
    ExamplePropertyType == Bool,
    DefaultValuePropertyType == Bool
{

}

extension BoolSchemaRepresentable {

    /// Builds a boolean JSON schema.
    /// - Returns: The JSON schema.
    public func openAPISchema() -> JSONSchema {
        .boolean(
            format: .generic,
            required: `required`,
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
