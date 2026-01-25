//
//  CookieParameterRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Parameter located in a cookie.
public protocol CookieParameterRepresentable:
    ParameterRepresentable,
    RequiredProperty
{

}

extension CookieParameterRepresentable {

    /// Cookie parameter context.
    public var context: OpenAPI.Parameter.Context {
        .cookie(required: `required`)
    }
}
