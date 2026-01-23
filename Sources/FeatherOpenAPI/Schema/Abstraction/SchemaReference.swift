//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol SchemaReferenceRepresentable {
    var id: SchemaID { get }
    var object: SchemaRepresentable { get }
}

public struct SchemaReference<T: SchemaRepresentable>: OpenAPISchemaRepresentable, SchemaReferenceRepresentable {
    
    public var object: any SchemaRepresentable {
        _object
    }

    public var id: SchemaID
    public var _object: T
    public var required: Bool
    
    public init(
        _ object: T,
        required: Bool = true
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
        self.required = required
    }

    public func openAPISchema() -> JSONSchema {
        .reference(.component(named: id.rawValue), required: required)
    }
}
