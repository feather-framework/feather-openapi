//
//  DocumentRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21.
//

public import OpenAPIKit30

/// Describes a high-level OpenAPI document with standard defaults.
public protocol DocumentRepresentable:
    OpenAPIDocumentRepresentable,
    VendorExtensionsProperty,
    ReferencedTagMapRepresentable,
    ReferencedSecuritySchemeMapRepresentable
{
    /// The document information metadata.
    var info: any OpenAPIInfoRepresentable { get }
    /// The list of servers where the API is served.
    var servers: [any OpenAPIServerRepresentable] { get }
    /// The map of path items by path.
    var paths: PathMap { get }
    /// The reusable component definitions.
    var components: any OpenAPIComponentsRepresentable { get }
    /// External documentation for this API, if any.
    var externalDocs: (any ExternalDocsRepresentable)? { get }
}

extension DocumentRepresentable {

    /// Default servers for the document.
    public var servers: [any OpenAPIServerRepresentable] { [] }
    /// Default empty path map.
    public var paths: PathMap { [:] }

    /// Default external docs is `nil`.
    public var externalDocs: (any ExternalDocsRepresentable)? { nil }

    /// Collects all tags referenced by the document.
    public var referencedTags: [any OpenAPITagRepresentable] {
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
        [any SecurityRequirementRepresentable]
    {
        var seen = Set<String>()
        return paths.values
            .map { $0.referencedSecurityRequirements }
            .flatMap { $0 }
            .filter { requirement in
                let requirementID =
                    requirement.security.openAPIIdentifier + "::"
                    + requirement.requirements.sorted().joined(separator: ",")
                if seen.contains(requirementID) {
                    return false
                }
                seen.insert(requirementID)
                return true
            }
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
