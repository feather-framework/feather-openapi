//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public struct SchemaReference: OpenAPISchemaRepresentable {
    
    public var id: String
    public var required: Bool
    
    public init<T: OpenAPISchemaRepresentable & Identifiable>(
        _ type: T,
        required: Bool = true
    ) {
        self.id = type.openAPIIdentifier
        self.required = required
    }

    public func openAPISchema() -> JSONSchema {
        .reference(.component(named: id), required: required)
    }
}
