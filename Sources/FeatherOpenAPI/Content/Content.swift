//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//


public struct Content<T: OpenAPISchemaRepresentable>: ContentRepresentable {
    
    public var schema: any OpenAPISchemaRepresentable {
        _schema
    }

    var _schema: T
    
    public init(_ schema: T) {
        self._schema = schema
    }
    
}
