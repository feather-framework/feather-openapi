//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct SecuritySchemeID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol SecuritySchemeRepresentable {
    func openAPISecurityScheme() -> OpenAPI.SecurityScheme
}

extension OpenAPI.SecurityScheme: SecuritySchemeRepresentable {
    
    public func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        self
    }
}

// MARK: -

public struct SecurityScheme: SecuritySchemeRepresentable {

    public var type: OpenAPI.SecurityScheme.SecurityType
    public var description: String?
    public var vendorExtensions: [String: AnyCodable]

    public func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        .init(
            type: type,
            description: description,
            vendorExtensions: vendorExtensions
        )
    }
}
