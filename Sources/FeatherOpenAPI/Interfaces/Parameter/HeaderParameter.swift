//
//  File.swift
//
//
//  Created by Tibor Bodecs on 15/02/2024.
//

import OpenAPIKit30

public protocol HeaderParameter: Parameter {}

public extension HeaderParameter {

    // TODO:
    static var context: OpenAPI.Parameter.Context {
        .header(required: Self.required)
        //        .header(
        //            required: Self.required,
        //            schemaOrContent: .schema(
        //                .schema(
        //                    Self.schema.openAPISchema(),
        //                    style: .default(
        //                        for: .header
        //                    )
        //                )
        //            )
        //        )
    }
}
