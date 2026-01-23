//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIOperationRepresentable {
    func openAPIOperation() -> OpenAPI.Operation
}

extension OpenAPI.Operation: OpenAPIOperationRepresentable {

    public func openAPIOperation() -> OpenAPI.Operation {
        self
    }
}
