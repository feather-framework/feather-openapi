//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol DocumentRepresentable:
    OpenAPIDocumentRepresentable,
    VendorExtensionsProperty
{
    var info: OpenAPIInfoRepresentable { get }
    var servers: [OpenAPIServerRepresentable] { get }
    var paths: PathMap { get }
    var components: OpenAPIComponentsRepresentable { get }
    var security: [OpenAPISecurityRequirementRepresentable] { get }
    var externalDocs: ExternalDocsRepresentable? { get }
}

public extension DocumentRepresentable {

    var servers: [OpenAPIServerRepresentable] { [] }
    var paths: PathMap { [:] }

    var security: [OpenAPISecurityRequirementRepresentable] { [] }
    var externalDocs: ExternalDocsRepresentable? { nil }
    
    func openAPIDocument() -> OpenAPI.Document {
        .init(
            openAPIVersion: .v3_0_0,
            info: info.openAPIInfo(),
            servers: servers.map { $0.openAPIServer() },
            paths: paths.mapValues { .init($0.openAPIPathItem()) },
            components: components.openAPIComponents(),
            security: security.map { $0.openAPISecurityRequirement() },
            tags: nil,
            externalDocs: externalDocs?.openAPIExternalDocs(),
            vendorExtensions: vendorExtensions
        )
    }
}
