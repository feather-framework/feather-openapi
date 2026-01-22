//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ContactRepresentable {

    func openAPIContact() -> OpenAPI.Document.Info.Contact
}

public struct Contact: ContactRepresentable {

    public let name: String?
    public let url: URLRepresentable?
    public let email: String?
    public var vendorExtensions: [String: AnyCodable]

    public func openAPIContact() -> OpenAPI.Document.Info.Contact {
        .init(
            name: name,
            url: url?.url(),
            email: email,
            vendorExtensions: vendorExtensions
        )
    }
}
