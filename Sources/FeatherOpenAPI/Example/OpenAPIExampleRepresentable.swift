//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIExampleRepresentable {
    func openAPIExample() -> Either<JSONReference<OpenAPI.Example>, OpenAPI.Example>
}

extension OpenAPI.Example: OpenAPIExampleRepresentable {

    public func openAPIExample() -> Either<JSONReference<OpenAPI.Example>, OpenAPI.Example> {
        .init(self)
    }
}
