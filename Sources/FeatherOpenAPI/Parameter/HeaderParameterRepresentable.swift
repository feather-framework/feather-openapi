//
//  HeaderParameterRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Parameter located in a header.
public protocol HeaderParameterRepresentable:
    ParameterRepresentable,
    RequiredProperty
{

}

extension HeaderParameterRepresentable {

    /// Header parameter context.
    public var context: OpenAPI.Parameter.Context {
        .header(required: `required`)
    }
}
