//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol QueryParameterRepresentable: ParameterRepresentable {
    
    var required: Bool { get }
    var allowEmptyValue: Bool { get }
}

public extension QueryParameterRepresentable {

    var required: Bool { false }
    var allowEmptyValue: Bool { true }
    
    var context: OpenAPI.Parameter.Context {
        .query(
            required: required,
            allowEmptyValue: allowEmptyValue
        )
    }
}
