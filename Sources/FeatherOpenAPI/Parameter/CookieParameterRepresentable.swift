//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol CookieParameterRepresentable:
    ParameterRepresentable,
    RequiredProperty
{

}

public extension CookieParameterRepresentable {
    
    var context: OpenAPI.Parameter.Context {
        .cookie(required: `required`)
    }
}
