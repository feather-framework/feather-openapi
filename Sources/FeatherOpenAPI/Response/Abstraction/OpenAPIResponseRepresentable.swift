//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol OpenAPIResponseRepresentable {
    func openAPIResponse() -> Either<JSONReference<OpenAPI.Response>, OpenAPI.Response>
}

extension OpenAPI.Response: OpenAPIResponseRepresentable {

    public func openAPIResponse() -> Either<JSONReference<OpenAPI.Response>, OpenAPI.Response> {
        .init(self)
    }
}
