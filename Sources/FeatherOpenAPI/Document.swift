//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol DocumentRepresentable {
    func openAPIDocument() -> OpenAPI.Document
}

extension OpenAPI.Document: DocumentRepresentable {

    public func openAPIDocument() -> OpenAPI.Document {
        self
    }
}

// MARK: -

public struct Document: DocumentRepresentable {

    public var info: InfoRepresentable
    public var servers: [ServerRepresentable]
    public var paths: OrderedDictionary<OpenAPI.Path, PathItemRepresentable>
    public var components: ComponentsRepresentable
    public var security: [SecurityRequirementRepresentable]
    public var externalDocumentation: ExternalDocumentationRepresentable?
    public var vendorExtensions: [String: AnyCodable]

    public init(
        info: InfoRepresentable,
        servers: [ServerRepresentable] = [],
        paths: OrderedDictionary<OpenAPI.Path, PathItemRepresentable>,
        components: ComponentsRepresentable,
        security: [SecurityRequirementRepresentable] = [],
        externalDocumentation: ExternalDocumentationRepresentable? = nil,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.info = info
        self.servers = servers
        self.paths = paths
        self.components = components
        self.security = security
        self.externalDocumentation = externalDocumentation
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIDocument() -> OpenAPI.Document {
        .init(
            openAPIVersion: .v3_0_0,
            info: info.openAPIInfo(),
            servers: servers.map { $0.openAPIServer() },
            paths: self.paths.mapValues { .init($0.openAPIPathItem()) },
            components: components.openAPIComponents(),
            security: security.map { $0.openAPISecurityRequirement() },
            tags: nil,
            externalDocs: externalDocumentation?.openAPIExternalDocumentation(),
            vendorExtensions: vendorExtensions
        )
    }
}
