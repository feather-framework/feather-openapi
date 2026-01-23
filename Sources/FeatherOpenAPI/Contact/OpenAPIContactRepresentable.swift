//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPIContactRepresentable {

    func openAPIContact() -> OpenAPI.Document.Info.Contact
}

extension OpenAPI.Document.Info.Contact: OpenAPIContactRepresentable {

    public func openAPIContact() -> OpenAPI.Document.Info.Contact {
        self
    }
}
