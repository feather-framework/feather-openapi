//
//  OpenAPIContactRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce OpenAPI contact information.
public protocol OpenAPIContactRepresentable {

    /// Returns the OpenAPI contact representation.
    /// - Returns: The OpenAPI contact.
    func openAPIContact() -> OpenAPI.Document.Info.Contact
}

extension OpenAPI.Document.Info.Contact: OpenAPIContactRepresentable {

    /// Returns `self` as OpenAPI contact information.
    /// - Returns: The current contact value.
    public func openAPIContact() -> OpenAPI.Document.Info.Contact {
        self
    }
}
