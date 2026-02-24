//
//  DoubleSchemaRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Schema representation for double values.
public protocol DoubleSchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty,
    DefaultValueProperty,
    AllowedValuesProperty
where
    ExamplePropertyType == Double,
    DefaultValuePropertyType == Double,
    AllowedValuesPropertyType == Double
{

}

extension DoubleSchemaRepresentable {

    /// Builds a double JSON schema.
    /// - Returns: The JSON schema.
    public func openAPISchema() -> JSONSchema {
        .number(
            format: .double,
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
            defaultValue: defaultValue.map { .init($0) },
            example: example.map { .init($0) }
        )
    }
}
