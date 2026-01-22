//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol JSONRequestBodyRepresentable: RequestBodyRepresentable {
    associatedtype SchemaType: OpenAPISchemaRepresentable
    
    var schema: SchemaType { get }
}

public extension JSONRequestBodyRepresentable {

    var contentMap: ContentMap {
        [
            .json: Content(schema)
        ]
    }
}

