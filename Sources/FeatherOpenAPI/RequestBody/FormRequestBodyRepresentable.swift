//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol FormRequestBodyRepresentable: RequestBodyRepresentable {
    associatedtype SchemaType: SchemaRepresentable
    
    var schema: SchemaType { get }
}

public extension FormRequestBodyRepresentable {

    var contentMap: ContentMap {
        [
            .form: Content(schema)
        ]
    }
}

