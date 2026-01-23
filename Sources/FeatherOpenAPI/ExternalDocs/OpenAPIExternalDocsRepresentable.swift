//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIExternalDocsRepresentable {
    func openAPIExternalDocs() -> OpenAPI.ExternalDocumentation
}

extension OpenAPI.ExternalDocumentation: OpenAPIExternalDocsRepresentable {

    public func openAPIExternalDocs() -> OpenAPI.ExternalDocumentation {
        self
    }
}

