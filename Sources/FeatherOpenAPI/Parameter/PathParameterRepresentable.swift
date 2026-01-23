//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol PathParameterRepresentable: ParameterRepresentable {
    
}

public extension PathParameterRepresentable {

    var context: OpenAPI.Parameter.Context { .path }
}
