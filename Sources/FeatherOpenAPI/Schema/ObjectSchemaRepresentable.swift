//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol ObjectSchemaRepresentable:
    SchemaRepresentable,
    ExampleProperty
where
    ExamplePropertyType == AnyCodable
{
    var propertyMap: SchemaMap { get }
}

public extension ObjectSchemaRepresentable {

    func openAPISchema() -> JSONSchema {
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
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
//
//        for property in propertyMap.values {
//            if let ref = property as? SchemaReferenceRepresentable {
//                results[ref.id] = ref.object
//            }
//        }

        for (_, value) in propertyMap {
            if let ref = value as? SchemaReferenceRepresentable {
                results[ref.id] = ref.object
            }
        }
        return results
    }
}

