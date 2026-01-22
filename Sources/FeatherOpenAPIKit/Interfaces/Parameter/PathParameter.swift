//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30

public protocol PathParameter: Parameter {}

public extension PathParameter {

    // TODO:
    static var context: OpenAPI.Parameter.Context {
        .path
        //        .path(
        //            schema: Self.schema.openAPISchema()
        //        )
    }
}
