//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30
import FeatherOpenAPI30

extension ParameterID {
    static var foo: Self { .init(#function) }
}

extension Parameter {

    static var foo: Self {
        Parameter(
            name: "foo",
            context: .path,
            schema: .test
        )
    }
}
