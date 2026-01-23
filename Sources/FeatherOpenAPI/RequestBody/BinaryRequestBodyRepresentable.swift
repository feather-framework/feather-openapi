//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol BinaryRequestBodyRepresentable: RequestBodyRepresentable {

}

public extension BinaryRequestBodyRepresentable {

    var contentMap: ContentMap {
        [
            .other("application/octet-stream"): Content(BinarySchema())
        ]
    }
}

#warning("move this")
struct BinarySchema: SchemaRepresentable {
    
    func openAPISchema() -> JSONSchema {
        JSONSchema.string(
            format: .binary
        )
    }

    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        [:]
    }
}
