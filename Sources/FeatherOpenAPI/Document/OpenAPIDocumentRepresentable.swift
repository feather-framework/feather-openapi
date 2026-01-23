//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIDocumentRepresentable {
    func openAPIDocument() -> OpenAPI.Document
}

extension OpenAPI.Document: OpenAPIDocumentRepresentable {

    public func openAPIDocument() -> OpenAPI.Document {
        self
    }
}
