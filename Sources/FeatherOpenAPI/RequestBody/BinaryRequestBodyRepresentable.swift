//
//  BinaryRequestBodyRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// Request body with binary content.
public protocol BinaryRequestBodyRepresentable: RequestBodyRepresentable {

}

extension BinaryRequestBodyRepresentable {

    /// Builds a binary content map using an octet-stream schema.
    public var contentMap: ContentMap {
        [
            .other("application/octet-stream"): Content(BinarySchema())
        ]
    }
}
