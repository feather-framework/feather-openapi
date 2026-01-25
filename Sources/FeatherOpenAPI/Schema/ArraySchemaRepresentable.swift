//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol ArraySchemaRepresentable:
    SchemaRepresentable
{
    var items: SchemaRepresentable? { get }
}

public extension ArraySchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        .array(
            format: .generic,
            required: `required`,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: nil,
            externalDocs: nil,
            minItems: nil,
            maxItems: nil,
            uniqueItems: nil,
            items: items?.openAPISchema(),
            allowedValues: nil,
            defaultValue: nil,
            example: nil
        )
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> = [:]

        for (key, value) in items?.referencedSchemaMap ?? [:] {
//            if let ref = value as? SchemaReferenceRepresentable {
                results[key] = value
//            }
        }
        return results
    }
}

