//
//  ObjectSchemaRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Schema representation for objects.
public protocol ObjectSchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty
where
    ExamplePropertyType == AnyCodable
{
    /// Map of property names to schemas.
    var propertyMap: SchemaMap { get }
}

extension ObjectSchemaRepresentable {

    /// Builds an object JSON schema.
    /// - Returns: The JSON schema.
    public func openAPISchema() -> JSONSchema {
        .object(
            format: .generic,
            required: `required`,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: nil,
            externalDocs: nil,
            minProperties: nil,
            maxProperties: nil,
            properties: propertyMap.mapValues { $0.openAPISchema() },
            additionalProperties: nil,
            allowedValues: nil,
            defaultValue: nil,
            example: example
        )
    }

    /// Referenced schemas used by object properties.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        for (_, value) in propertyMap {
            results.merge(value.referencedSchemaMap)
        }
        return results
    }
}
