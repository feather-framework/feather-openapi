//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol ContentRepresentable:
    OpenAPIContentRepresentable,
    ReferencedSchemaMapRepresentable
{
    var schema: SchemaRepresentable { get }
}

public extension ContentRepresentable {

    func openAPIContent() -> OpenAPI.Content {
        .init(
            schema: schema.openAPISchema(),
            examples: nil,
            encoding: nil,
            vendorExtensions: [:]
        )
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        schema.referencedSchemaMap
    }
}
