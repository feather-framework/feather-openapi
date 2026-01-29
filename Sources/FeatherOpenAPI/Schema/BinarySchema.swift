//
//  BinarySchema.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 24..
//

import OpenAPIKit30

struct BinarySchema: SchemaRepresentable {

    func openAPISchema() -> JSONSchema {
        JSONSchema.string(
            format: .binary
        )
    }

    var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        [:]
    }
}
