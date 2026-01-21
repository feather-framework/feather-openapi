//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30

extension SchemaID {
    static var test: Self { .init(#function) }

    static var customResponseHeader: Self { .init(#function) }
}

extension StringSchema {

    static var customResponseHeader: Self {
        .init(
            description: "Custom header",
            example: "my-example-key"
        )
    }
}
