//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIVariableRepresentable {
    func openAPIServerVariable() -> OpenAPI.Server.Variable
}

extension OpenAPI.Server.Variable: OpenAPIVariableRepresentable {
    
    public func openAPIServerVariable() -> OpenAPI.Server.Variable {
        self
    }
}
