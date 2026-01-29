//
//  PathParameterRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Parameter located in the path.
public protocol PathParameterRepresentable: ParameterRepresentable {

}

extension PathParameterRepresentable {

    /// Path parameter context.
    public var context: OpenAPI.Parameter.Context { .path }
}
