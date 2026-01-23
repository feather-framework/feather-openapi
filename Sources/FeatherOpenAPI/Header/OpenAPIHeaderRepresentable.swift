//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIHeaderRepresentable {
    func openAPIHeader() -> Either<JSONReference<OpenAPI.Header>, OpenAPI.Header>
}

extension OpenAPI.Header: OpenAPIHeaderRepresentable {

    public func openAPIHeader() -> Either<JSONReference<OpenAPI.Header>, OpenAPI.Header> {
        .init(self)
    }
}
