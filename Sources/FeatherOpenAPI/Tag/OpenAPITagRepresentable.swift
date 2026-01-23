//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol OpenAPITagRepresentable {
    func openAPITag() -> OpenAPI.Tag
}

extension OpenAPI.Tag: OpenAPITagRepresentable {

    public func openAPITag() -> OpenAPI.Tag {
        self
    }
}
