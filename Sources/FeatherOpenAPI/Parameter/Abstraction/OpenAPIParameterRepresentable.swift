//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIParameterRepresentable {
    func openAPIParameter() -> Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter>
}

extension OpenAPI.Parameter: OpenAPIParameterRepresentable {
    
    public func openAPIParameter() -> Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter> {
        .init(self)
    }
}
