//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol OpenAPIContentRepresentable {
    func openAPIContent() -> OpenAPI.Content
}

extension OpenAPI.Content: OpenAPIContentRepresentable {

    public func openAPIContent() -> OpenAPI.Content {
        self
    }
}

// MARK: -




