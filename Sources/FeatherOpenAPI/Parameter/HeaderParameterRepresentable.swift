//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol HeaderParameterRepresentable:
    ParameterRepresentable,
    RequiredProperty
{
    
}

public extension HeaderParameterRepresentable {
    
    var context: OpenAPI.Parameter.Context {
        .header(required: `required`)
    }
}
