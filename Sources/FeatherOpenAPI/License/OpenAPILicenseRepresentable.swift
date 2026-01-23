//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPILicenseRepresentable {
    func openAPILicense() -> OpenAPI.Document.Info.License
}

extension OpenAPI.Document.Info.License: OpenAPILicenseRepresentable {

    public func openAPILicense() -> OpenAPI.Document.Info.License {
        self
    }
}
