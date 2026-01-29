//
//  OpenAPILicenseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce OpenAPI license information.
public protocol OpenAPILicenseRepresentable {
    /// Returns the OpenAPI license representation.
    /// - Returns: The OpenAPI license.
    func openAPILicense() -> OpenAPI.Document.Info.License
}

extension OpenAPI.Document.Info.License: OpenAPILicenseRepresentable {

    /// Returns `self` as OpenAPI license information.
    /// - Returns: The current license value.
    public func openAPILicense() -> OpenAPI.Document.Info.License {
        self
    }
}
