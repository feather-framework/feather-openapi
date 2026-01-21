//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30

extension Operation {

    static var foo: Self {
        .init(
            parameters: [
                .foo
            ],
            requestBody: .foo,
            responses: [
                200: .foo
            ]
        )
    }
}
