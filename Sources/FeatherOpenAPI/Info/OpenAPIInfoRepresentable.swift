//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol OpenAPIInfoRepresentable {

    func openAPIInfo() -> OpenAPI.Document.Info
}

extension OpenAPI.Document.Info: OpenAPIInfoRepresentable {

    public func openAPIInfo() -> OpenAPI.Document.Info {
        self
    }
}
