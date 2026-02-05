//
//  DocumentRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes a high-level OpenAPI document with standard defaults.
public protocol DocumentRepresentable:
    OpenAPIDocumentRepresentable,
    VendorExtensionsProperty,
    ReferencedTagMapRepresentable,
    ReferencedSecuritySchemeMapRepresentable
{
    /// The document information metadata.
    var info: OpenAPIInfoRepresentable { get }
    /// The list of servers where the API is served.
    var servers: [OpenAPIServerRepresentable] { get }
    /// The map of path items by path.
    var paths: PathMap { get }
    /// The reusable component definitions.
    var components: OpenAPIComponentsRepresentable { get }
    /// External documentation for this API, if any.
    var externalDocs: ExternalDocsRepresentable? { get }
}

extension DocumentRepresentable {

    /// Default servers for the document.
    public var servers: [OpenAPIServerRepresentable] { [] }
    /// Default empty path map.
    public var paths: PathMap { [:] }

    /// Default external docs is `nil`.
    public var externalDocs: ExternalDocsRepresentable? { nil }

    /// Collects all tags referenced by the document.
    public var referencedTags: [OpenAPITagRepresentable] {
        var seen = Set<String>()
        return paths.values
            .map { $0.referencedTags }
            .flatMap { $0 }
            .filter { tag in
                let name = tag.openAPITag().name
                if seen.contains(name) {
                    return false
                }
                seen.insert(name)
                return true
            }
    }

    /// Collects all security requirements referenced by the document.
    public var referencedSecurityRequirements:
        [SecurityRequirementRepresentable]
    {
        paths.values.map { $0.referencedSecurityRequirements }.flatMap { $0 }
    }

    /// Builds an OpenAPI document from the representable values.
    /// - Returns: A concrete OpenAPI document.
    public func openAPIDocument() -> OpenAPI.Document {
        .init(
            openAPIVersion: .v3_0_0,
            info: info.openAPIInfo(),
            servers: servers.map { $0.openAPIServer() },
            paths: paths.mapValues { .init($0.openAPIPathItem()) },
            components: components.openAPIComponents(),
            security: referencedSecurityRequirements.map {
                $0.openAPISecurityRequirement()
            },
            tags: referencedTags.map { $0.openAPITag() },
            externalDocs: externalDocs?.openAPIExternalDocs(),
            vendorExtensions: vendorExtensions
        )
    }
}
