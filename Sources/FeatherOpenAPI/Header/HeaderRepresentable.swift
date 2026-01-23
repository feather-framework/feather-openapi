//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol HeaderRepresentable:
    OpenAPIHeaderRepresentable
{
    var schema: OpenAPISchemaRepresentable { get }
    
    var description: String? { get }
    var required: Bool { get }
    var deprecated: Bool { get }
}

public extension HeaderRepresentable {
    
    var description: String? { nil }
    var required: Bool { false }
    var deprecated: Bool { false }
    
    func openAPIHeader() -> OpenAPI.Header {
        .init(
            schema: schema.openAPISchema(),
            description: description,
            required: required,
            deprecated: deprecated,
            vendorExtensions: [:]
        )
    }
}
