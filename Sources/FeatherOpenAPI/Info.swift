//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol InfoRepresentable {

    func openAPIInfo() -> OpenAPI.Document.Info
}

public struct Info: InfoRepresentable {
    public var title: String
    public var description: String?
    public var termsOfService: URLRepresentable?
    public var contact: ContactRepresentable?
    public var license: LicenseRepresentable?
    public var version: String
    public var vendorExtensions: [String: AnyCodable]

    public init(
        title: String,
        description: String? = nil,
        termsOfService: URLRepresentable? = nil,
        contact: ContactRepresentable? = nil,
        license: LicenseRepresentable? = nil,
        version: String,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.title = title
        self.description = description
        self.termsOfService = termsOfService
        self.contact = contact
        self.license = license
        self.version = version
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIInfo() -> OpenAPI.Document.Info {
        .init(
            title: title,
            description: description,
            termsOfService: termsOfService?.url(),
            contact: contact.map { $0.openAPIContact() },
            license: license.map { $0.openAPILicense() },
            version: version,
            vendorExtensions: vendorExtensions
        )
    }
}
