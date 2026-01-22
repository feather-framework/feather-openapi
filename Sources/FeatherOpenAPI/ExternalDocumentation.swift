//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

import OpenAPIKit30

public protocol ExternalDocumentationRepresentable {
    func openAPIExternalDocumentation() -> OpenAPI.ExternalDocumentation
}

extension OpenAPI.ExternalDocumentation: ExternalDocumentationRepresentable {

    public func openAPIExternalDocumentation() -> OpenAPI.ExternalDocumentation {
        self
    }
}

// MARK: -

public struct ExternalDocumentation: ExternalDocumentationRepresentable {
    public var url: String
    public var description: String?
    public var vendorExtensions: [String: AnyCodable]

    public init(
        url: String,
        description: String? = nil,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.url = url
        self.description = description
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIExternalDocumentation() -> OpenAPI.ExternalDocumentation
    {
        .init(
            description: description,
            url: .init(string: url)!,
            vendorExtensions: vendorExtensions
        )
    }
}
