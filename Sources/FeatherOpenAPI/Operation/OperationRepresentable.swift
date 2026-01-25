//
//  OperationRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

extension String {

    fileprivate func lowercasedFirstLetter() -> String {
        guard !isEmpty else {
            return self
        }
        return prefix(1).lowercased() + dropFirst()
    }
}

/// Describes an OpenAPI operation with defaults and reference aggregation.
public protocol OperationRepresentable:
    OpenAPIOperationRepresentable,
    // properties
    DescriptionProperty,
    DeprecatedProperty,
    VendorExtensionsProperty,
    // references
    ReferencedSchemaMapRepresentable,
    ReferencedHeaderMapRepresentable,
    ReferencedRequestBodyMapRepresentable,
    ReferencedParameterMapRepresentable,
    ReferencedResponseMapRepresentable,
    ReferencedTagMapRepresentable,
    ReferencedSecuritySchemeMapRepresentable
{
    //    associatedtype RequestBodyType: RequestBodyRepresentable

    /// Tags associated with the operation.
    var tags: [TagRepresentable] { get }
    /// Short summary of the operation.
    var summary: String? { get }
    /// Optional explicit operation identifier.
    var operationId: String? { get }

    /// Parameters accepted by the operation.
    var parameters: [ParameterRepresentable] { get }
    /// Optional request body.
    var requestBody: RequestBodyRepresentable? { get }
    /// Response map keyed by status code.
    var responseMap: ResponseMap { get }

    /// Optional security requirements.
    var security: [SecurityRequirementRepresentable]? { get }
    /// Optional per-operation servers.
    var servers: [ServerRepresentable]? { get }
}

extension OperationRepresentable {

    /// Default tags are empty.
    public var tags: [TagRepresentable] { [] }
    /// Default summary is `nil`.
    public var summary: String? { nil }

    /// Default operation identifier is `nil`.
    public var operationId: String? { nil }
    /// Default parameters are empty.
    public var parameters: [ParameterRepresentable] { [] }

    /// Computes a default operation identifier from the type name.
    public static var operationId: String {
        var components = String(reflecting: self)
            .split(separator: ".")
            .dropFirst()
            .map(String.init)

        components.remove(at: 2)
        if let last = components.popLast()?.lowercasedFirstLetter() {
            components.insert(last, at: 0)
        }
        return components.joined(separator: "")
    }

    /// Default request body is `nil`.
    public var requestBody: RequestBodyRepresentable? { nil }
    /// Default security requirements are `nil`.
    public var security: [SecurityRequirementRepresentable]? { nil }
    /// Default servers list is `nil`.
    public var servers: [ServerRepresentable]? { nil }

    private var openAPITags: [String]? {
        tags.isEmpty ? nil : tags.map { $0.name }
    }

    private var openAPISecurityRequirements: [OpenAPI.SecurityRequirement]? {
        guard let security, !security.isEmpty else {
            return nil
        }

        return security.map { $0.openAPISecurityRequirement() }
    }

    /// Builds an OpenAPI operation.
    /// - Returns: The OpenAPI operation.
    public func openAPIOperation() -> OpenAPI.Operation {
        if let requestBody {
            return .init(
                tags: openAPITags,
                summary: summary,
                description: description,
                externalDocs: nil,
                operationId: operationId,
                parameters: parameters.map { $0.openAPIParameter() },
                requestBody: requestBody.openAPIRequestBody(),
                responses: responseMap.mapValues { $0.openAPIResponse() },
                callbacks: [:],
                deprecated: deprecated,
                security: openAPISecurityRequirements,
                servers: servers?.map { $0.openAPIServer() },
                vendorExtensions: vendorExtensions
            )
        }
        return .init(
            tags: openAPITags,
            summary: summary,
            description: description,
            externalDocs: nil,
            operationId: operationId,
            parameters: parameters.map { $0.openAPIParameter() },
            responses: responseMap.mapValues { $0.openAPIResponse() },
            callbacks: [:],
            deprecated: deprecated,
            security: openAPISecurityRequirements,
            servers: servers?.map { $0.openAPIServer() },
            vendorExtensions: vendorExtensions
        )
    }

    // MARK: - refs

    /// Aggregated referenced schemas from parameters, request body, and responses.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()

        for parameter in parameters {
            results.merge(parameter.referencedSchemaMap)
        }

        if let schemaMap = requestBody?.referencedSchemaMap {
            results.merge(schemaMap)
        }

        let headers = responseMap.values
            .map { $0.headerMap.values }
            .flatMap { $0 }

        for header in headers {
            results.merge(header.referencedSchemaMap)
        }

        let contents = responseMap.values
            .map { $0.contentMap.values }
            .flatMap { $0 }

        for content in contents {
            results.merge(content.referencedSchemaMap)
        }

        return results
    }

    /// Aggregated referenced parameters used by the operation.
    public var referencedParameterMap:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    {
        var results = OrderedDictionary<
            ParameterID, OpenAPIParameterRepresentable
        >()

        for parameter in parameters {
            if let ref = parameter as? ParameterReferenceRepresentable {
                if case .b(let parameter) = ref.object.openAPIParameter() {
                    results[ref.id] = parameter
                }
            }
        }
        return results
    }

    /// Aggregated referenced request bodies used by the operation.
    public var referencedRequestBodyMap:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    {
        var results = OrderedDictionary<
            RequestBodyID, OpenAPIRequestBodyRepresentable
        >()

        if let ref = requestBody as? RequestBodyReferenceRepresentable {
            results[ref.id] = ref.object
        }
        return results
    }

    /// Aggregated referenced headers used by responses.
    public var referencedHeaderMap:
        OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    {
        var results = OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>()

        let headers = responseMap.values
            .map { $0.headerMap.values }
            .flatMap { $0 }

        for header in headers {
            if let ref = header as? HeaderReferenceRepresentable {
                if case .b(let header) = ref.object.openAPIHeader() {
                    results[ref.id] = header
                }
            }
        }
        return results
    }

    /// Aggregated referenced responses used by the operation.
    public var referencedResponseMap:
        OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    {
        var results = OrderedDictionary<
            ResponseID, OpenAPIResponseRepresentable
        >()

        for response in responseMap.values {
            if let ref = response as? ResponseReferenceRepresentable {
                if case .b(let response) = ref.object.openAPIResponse() {
                    results[ref.id] = response
                }
            }
        }
        return results
    }

    /// Referenced tags for the operation.
    public var referencedTags: [OpenAPITagRepresentable] {
        tags
    }

    /// Referenced security requirements for the operation.
    public var referencedSecurityRequirements:
        [SecurityRequirementRepresentable]
    {
        security?.map { $0 } ?? []
    }
}
