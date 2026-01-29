//
//  BinaryResponseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Response with binary content.
public protocol BinaryResponseRepresentable: ResponseRepresentable {

}

extension BinaryResponseRepresentable {

    /// Builds a binary content map using an octet-stream schema.
    public var contentMap: ContentMap {
        [
            .other("application/octet-stream"): Content(BinarySchema())
        ]
    }
}
