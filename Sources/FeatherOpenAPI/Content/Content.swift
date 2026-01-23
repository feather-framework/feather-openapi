//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public struct Content<T: SchemaRepresentable>:
    ContentRepresentable
{
    public var schema: any SchemaRepresentable {
        _schema
    }

    var _schema: T
    
    public init(_ schema: T) {
        self._schema = schema
    }
}
