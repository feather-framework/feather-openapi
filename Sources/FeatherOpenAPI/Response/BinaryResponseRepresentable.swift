//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol BinaryResponseRepresentable: ResponseRepresentable {

}

public extension BinaryResponseRepresentable {

    var contentMap: ContentMap {
        [
            .other("application/octet-stream"): Content(BinarySchema())
        ]
    }
}

