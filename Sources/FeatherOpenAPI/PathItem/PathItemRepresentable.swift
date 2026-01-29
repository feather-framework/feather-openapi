//
//  PathItemRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI path item with HTTP operation bindings.
public protocol PathItemRepresentable:
    OpenAPIPathItemRepresentable,
    // properties
    DescriptionProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable,
    ReferencedParameterMapRepresentable,
    ReferencedRequestBodyMapRepresentable,
    ReferencedHeaderMapRepresentable,
    ReferencedResponseMapRepresentable,
    ReferencedTagMapRepresentable,
    ReferencedSecuritySchemeMapRepresentable
{
    /// Short summary for the path item.
    var summary: String? { get }

    /// Optional servers that override document-level servers.
    var servers: [OpenAPIServerRepresentable]? { get }
    /// GET operation for this path.
    var get: OperationRepresentable? { get }
    /// PUT operation for this path.
    var put: OperationRepresentable? { get }
    /// POST operation for this path.
    var post: OperationRepresentable? { get }
    /// DELETE operation for this path.
    var delete: OperationRepresentable? { get }
    /// OPTIONS operation for this path.
    var options: OperationRepresentable? { get }
    /// HEAD operation for this path.
    var head: OperationRepresentable? { get }
    /// PATCH operation for this path.
    var patch: OperationRepresentable? { get }
    /// TRACE operation for this path.
    var trace: OperationRepresentable? { get }
}

extension PathItemRepresentable {

    /// Default summary is `nil`.
    public var summary: String? { nil }

    /// Default servers list is `nil`.
    public var servers: [OpenAPIServerRepresentable]? { nil }
    /// Default GET operation is `nil`.
    public var get: OperationRepresentable? { nil }
    /// Default PUT operation is `nil`.
    public var put: OperationRepresentable? { nil }
    /// Default POST operation is `nil`.
    public var post: OperationRepresentable? { nil }
    /// Default DELETE operation is `nil`.
    public var delete: OperationRepresentable? { nil }
    /// Default OPTIONS operation is `nil`.
    public var options: OperationRepresentable? { nil }
    /// Default HEAD operation is `nil`.
    public var head: OperationRepresentable? { nil }
    /// Default PATCH operation is `nil`.
    public var patch: OperationRepresentable? { nil }
    /// Default TRACE operation is `nil`.
    public var trace: OperationRepresentable? { nil }

    /// Builds an OpenAPI path item.
    /// - Returns: The OpenAPI path item.
    public func openAPIPathItem() -> OpenAPI.PathItem {
        .init(
            summary: summary,
            description: description,
            servers: servers?.map { $0.openAPIServer() },
            parameters: [],
            get: get?.openAPIOperation(),
            put: put?.openAPIOperation(),
            post: post?.openAPIOperation(),
            delete: delete?.openAPIOperation(),
            options: options?.openAPIOperation(),
            head: head?.openAPIOperation(),
            patch: patch?.openAPIOperation(),
            trace: trace?.openAPIOperation(),
            vendorExtensions: vendorExtensions
        )
    }

    /// All non-nil operations declared on the path item.
    public var allOperations: [OperationRepresentable] {
        [
            get,
            put,
            post,
            delete,
            options,
            head,
            patch,
            trace,
        ]
        .compactMap { $0 }
    }

    /// Aggregated referenced schemas from operations.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()

        let maps = allOperations.map { $0.referencedSchemaMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced parameters from operations.
    public var referencedParameterMap:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    {
        var results = OrderedDictionary<
            ParameterID, OpenAPIParameterRepresentable
        >()

        let maps = allOperations.map { $0.referencedParameterMap }
            .flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced request bodies from operations.
    public var referencedRequestBodyMap:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    {
        var results = OrderedDictionary<
            RequestBodyID, OpenAPIRequestBodyRepresentable
        >()

        let maps = allOperations.map { $0.referencedRequestBodyMap }
            .flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced headers from operations.
    public var referencedHeaderMap:
        OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    {
        var results = OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>()

        let maps = allOperations.map { $0.referencedHeaderMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced responses from operations.
    public var referencedResponseMap:
        OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    {
        var results = OrderedDictionary<
            ResponseID, OpenAPIResponseRepresentable
        >()

        let maps = allOperations.map { $0.referencedResponseMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced tags from operations.
    public var referencedTags: [OpenAPITagRepresentable] {
        allOperations.map { $0.referencedTags }.flatMap { $0 }
    }

    /// Aggregated referenced security requirements from operations.
    public var referencedSecurityRequirements:
        [SecurityRequirementRepresentable]
    {
        allOperations.map { $0.referencedSecurityRequirements }.flatMap { $0 }
    }
}
