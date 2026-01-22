//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol RequestBodyRepresentable:
    Identifiable,
    OpenAPIRequestBodyRepresentable,
    RequestBodyPropertyDescription,
    RequestBodyPropertyRequired
{
    var contentMap: ContentMap { get }
}

extension RequestBodyRepresentable {

    public func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: description,
            content: contentMap.mapValues { $0.openAPIContent() },
            required: required,
            vendorExtensions: [:]
        )
    }
}
