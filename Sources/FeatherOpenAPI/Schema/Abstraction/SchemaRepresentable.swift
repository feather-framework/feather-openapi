//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol SchemaRepresentable:
    OpenAPISchemaRepresentable,
    Identifiable,
    ReferencedSchemaMapRepresentable
{
    
}

extension SchemaRepresentable {

    public var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        [:]
    }
}
