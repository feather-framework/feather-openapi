//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol DocumentRepresentable:
    OpenAPIDocumentRepresentable,
    VendorExtensionsProperty,
    ReferencedTagMapRepresentable,
    ReferencedSecuritySchemeMapRepresentable
{
    var info: OpenAPIInfoRepresentable { get }
    var servers: [OpenAPIServerRepresentable] { get }
    var paths: PathMap { get }
    var components: OpenAPIComponentsRepresentable { get }
    var externalDocs: ExternalDocsRepresentable? { get }
}

public extension DocumentRepresentable {

    var servers: [OpenAPIServerRepresentable] { [] }
    var paths: PathMap { [:] }

    var externalDocs: ExternalDocsRepresentable? { nil }

    var referencedTags: [OpenAPITagRepresentable] {
        paths.values.map { $0.referencedTags }.flatMap { $0 }
    }

    var referencedSecurityRequirements: [SecurityRequirementRepresentable] {
        paths.values.map { $0.referencedSecurityRequirements }.flatMap { $0 }
    }
    
    func openAPIDocument() -> OpenAPI.Document {
        .init(
            openAPIVersion: .v3_0_0,
            info: info.openAPIInfo(),
            servers: servers.map { $0.openAPIServer() },
            paths: paths.mapValues { .init($0.openAPIPathItem()) },
            components: components.openAPIComponents(),
            security: referencedSecurityRequirements.map { $0.openAPISecurityRequirement() },
            tags: referencedTags.map { $0.openAPITag() },
            externalDocs: externalDocs?.openAPIExternalDocs(),
            vendorExtensions: vendorExtensions
        )
    }
}
