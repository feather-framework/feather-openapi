//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol FormResponseRepresentable: ResponseRepresentable {
    associatedtype SchemaType: SchemaRepresentable
    
    var schema: SchemaType { get }
}

public extension FormResponseRepresentable {

    var contentMap: ContentMap {
        [
            .form: Content(schema)
        ]
    }
}

