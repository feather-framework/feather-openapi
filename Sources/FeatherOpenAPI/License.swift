//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol LicenseRepresentable {
    func openAPILicense() -> OpenAPI.Document.Info.License
}

public struct License: LicenseRepresentable {
    public let name: String
    public let url: URLRepresentable?
    public var vendorExtensions: [String: AnyCodable]

    public func openAPILicense() -> OpenAPI.Document.Info.License {
        .init(
            name: name,
            url: url?.url(),
            vendorExtensions: vendorExtensions
        )
    }
}
