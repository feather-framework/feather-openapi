//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol PathParameter: Parameter {}

public extension PathParameter {

    static var context: OpenAPI.Parameter.Context {
        .path(
            schema: Self.schema.openAPISchema()
        )
    }
}
