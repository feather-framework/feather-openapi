//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol OpenAPISchemaRepresentable {

    func openAPISchema() -> JSONSchema
}

extension JSONSchema: OpenAPISchemaRepresentable {

    public func openAPISchema() -> JSONSchema { self }
}


