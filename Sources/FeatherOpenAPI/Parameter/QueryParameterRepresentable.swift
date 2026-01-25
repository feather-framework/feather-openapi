//
//  QueryParameterRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Parameter located in the query string.
public protocol QueryParameterRepresentable:
    ParameterRepresentable,
    RequiredProperty
{
    /// Whether empty values are allowed.
    var allowEmptyValue: Bool { get }
}

extension QueryParameterRepresentable {

    /// Default empty value allowance is `true`.
    public var allowEmptyValue: Bool { true }

    /// Query parameter context.
    public var context: OpenAPI.Parameter.Context {
        .query(
            required: `required`,
            allowEmptyValue: allowEmptyValue
        )
    }
}
