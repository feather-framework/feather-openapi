//
//  File.swift
//
//
//  Created by Tibor Bodecs on 15/02/2024.
//

import OpenAPIKit

public protocol HeaderParameter: Parameter {}

public extension HeaderParameter {

    static var context: OpenAPI.Parameter.Context {
        .header(
            required: Self.required,
            schemaOrContent: .schema(
                .schema(
                    Self.schema.openAPISchema(),
                    style: .default(
                        for: .header
                    )
                )
            )
        )
    }
}
