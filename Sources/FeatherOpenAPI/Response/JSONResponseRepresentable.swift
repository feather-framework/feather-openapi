//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol JSONResponseRepresentable: ResponseRepresentable {
    associatedtype SchemaType: SchemaRepresentable
    
    var schema: SchemaType { get }
}

public extension JSONResponseRepresentable {

    var contentMap: ContentMap {
        [
            .json: Content(schema)
        ]
    }
}

