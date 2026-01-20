//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol QueryParameter: Parameter {}

public extension QueryParameter {

    static var required: Bool { false }

    static var context: OpenAPI.Parameter.Context {
        .query(
            required: Self.required,
            schemaOrContent: .schema(
                .schema(
                    Self.schema.openAPISchema(),
                    style: .default(
                        for: .query
                    )
                )
            )
        )
    }
}
