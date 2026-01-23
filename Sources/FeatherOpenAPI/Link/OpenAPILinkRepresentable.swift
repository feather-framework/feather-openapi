//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPILinkRepresentable {
    func openAPILink() -> OpenAPI.Link
}

extension OpenAPI.Link: OpenAPILinkRepresentable {

    public func openAPILink() -> OpenAPI.Link {
        self
    }
}
