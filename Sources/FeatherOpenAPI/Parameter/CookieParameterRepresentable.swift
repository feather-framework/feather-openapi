//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol CookieParameterRepresentable: ParameterRepresentable {
    
    var required: Bool { get }
}

public extension CookieParameterRepresentable {

    var required: Bool { false }
    
    var context: OpenAPI.Parameter.Context {
        .cookie(required: required)
    }
}
