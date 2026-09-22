//
//  PathItemRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21.
//

public import OpenAPIKit30

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
    var servers: [any OpenAPIServerRepresentable]? { get }
    /// GET operation for this path.
    var get: (any OperationRepresentable)? { get }
    /// PUT operation for this path.
    var put: (any OperationRepresentable)? { get }
    /// POST operation for this path.
    var post: (any OperationRepresentable)? { get }
    /// DELETE operation for this path.
    var delete: (any OperationRepresentable)? { get }
    /// OPTIONS operation for this path.
    var options: (any OperationRepresentable)? { get }
    /// HEAD operation for this path.
    var head: (any OperationRepresentable)? { get }
    /// PATCH operation for this path.
    var patch: (any OperationRepresentable)? { get }
    /// TRACE operation for this path.
    var trace: (any OperationRepresentable)? { get }
}

extension PathItemRepresentable {

    /// Default summary is `nil`.
    public var summary: String? { nil }

    /// Default servers list is `nil`.
    public var servers: [any OpenAPIServerRepresentable]? { nil }
    /// Default GET operation is `nil`.
    public var get: (any OperationRepresentable)? { nil }
    /// Default PUT operation is `nil`.
    public var put: (any OperationRepresentable)? { nil }
    /// Default POST operation is `nil`.
    public var post: (any OperationRepresentable)? { nil }
    /// Default DELETE operation is `nil`.
    public var delete: (any OperationRepresentable)? { nil }
    /// Default OPTIONS operation is `nil`.
    public var options: (any OperationRepresentable)? { nil }
    /// Default HEAD operation is `nil`.
    public var head: (any OperationRepresentable)? { nil }
    /// Default PATCH operation is `nil`.
    public var patch: (any OperationRepresentable)? { nil }
    /// Default TRACE operation is `nil`.
    public var trace: (any OperationRepresentable)? { nil }

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
    public var allOperations: [any OperationRepresentable] {
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
        OrderedDictionary<SchemaID, any OpenAPISchemaRepresentable>
    {
        var results = OrderedDictionary<SchemaID, any OpenAPISchemaRepresentable>()

        let maps = allOperations.map { $0.referencedSchemaMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced parameters from operations.
    public var referencedParameterMap:
        OrderedDictionary<ParameterID, any OpenAPIParameterRepresentable>
    {
        var results = OrderedDictionary<
            ParameterID, any OpenAPIParameterRepresentable
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
        OrderedDictionary<RequestBodyID, any OpenAPIRequestBodyRepresentable>
    {
        var results = OrderedDictionary<
            RequestBodyID, any OpenAPIRequestBodyRepresentable
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
        OrderedDictionary<HeaderID, any OpenAPIHeaderRepresentable>
    {
        var results = OrderedDictionary<HeaderID, any OpenAPIHeaderRepresentable>()

        let maps = allOperations.map { $0.referencedHeaderMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced responses from operations.
    public var referencedResponseMap:
        OrderedDictionary<ResponseID, any OpenAPIResponseRepresentable>
    {
        var results = OrderedDictionary<
            ResponseID, any OpenAPIResponseRepresentable
        >()

        let maps = allOperations.map { $0.referencedResponseMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced tags from operations.
    public var referencedTags: [any OpenAPITagRepresentable] {
        allOperations.map { $0.referencedTags }.flatMap { $0 }
    }

    /// Aggregated referenced security requirements from operations.
    public var referencedSecurityRequirements:
        [any SecurityRequirementRepresentable]
    {
        allOperations.map { $0.referencedSecurityRequirements }.flatMap { $0 }
    }
}
