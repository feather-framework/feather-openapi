//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

protocol ObjectSchemaRepresentable:
    Identifiable,
    OpenAPISchemaRepresentable,
    SchemaPropertyRequired,
    SchemaPropertyTitle,
    SchemaPropertyDescription,
    SchemaPropertyDeprecated,
    SchemaPropertyNullable,
    SchemaPropertyExample where ExamplePropertyType == AnyCodable
{
    var properties: OrderedDictionary<String, OpenAPISchemaRepresentable> { get }
}

extension ObjectSchemaRepresentable {

    public func openAPISchema() -> JSONSchema {
        .object(
            format: .generic,
            required: required,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: nil,
            externalDocs: nil,
            minProperties: nil,
            maxProperties: nil,
            properties: properties.mapValues { $0.openAPISchema() },
            additionalProperties: nil,
            allowedValues: nil,
            defaultValue: nil,
            example: example
        )
    }
}

