//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

fileprivate extension String {

    func lowercasedFirstLetter() -> String {
        guard !isEmpty else {
            return self
        }
        return prefix(1).lowercased() + dropFirst()
    }
}


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
    
    var tags: [TagRepresentable] { get }
    var summary: String? { get }
    var operationId: String? { get }

    var parameters: [ParameterRepresentable] { get }
    var requestBody: RequestBodyRepresentable? { get }
    var responseMap: ResponseMap { get }

    var security: [SecurityRequirementRepresentable]? { get }
    var servers: [ServerRepresentable]? { get }
}

public extension OperationRepresentable {

    var tags: [TagRepresentable] { [] }
    var summary: String? { nil }
    
    var operationId: String? { nil }
    var parameters: [ParameterRepresentable] { [] }
    
    static var operationId: String {
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


    var requestBody: RequestBodyRepresentable? { nil }
    var security: [SecurityRequirementRepresentable]? { nil }
    var servers: [ServerRepresentable]? { nil }
    
    private var openAPITags: [String]? {
        tags.isEmpty ? nil : tags.map { $0.name }
    }
        
    private var openAPISecurityRequirements: [OpenAPI.SecurityRequirement]? {
        guard let security, !security.isEmpty else {
            return nil
        }

        return security.map { $0.openAPISecurityRequirement() }
    }
    
    func openAPIOperation() -> OpenAPI.Operation {
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
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
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
    
    var referencedParameterMap: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable> {
        var results = OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>()
        
        for parameter in parameters {
            if let ref = parameter as? ParameterReferenceRepresentable {
                if case let .b(parameter) = ref.object.openAPIParameter() {
                    results[ref.id] = parameter
                }
            }
        }
        return results
    }

    var referencedRequestBodyMap: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable> {
        var results = OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>()

        if let ref = requestBody as? RequestBodyReferenceRepresentable {
            results[ref.id] = ref.object
        }
        return results
    }

    var referencedHeaderMap: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> {
        var results = OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>()

        let headers = responseMap.values
            .map { $0.headerMap.values }
            .flatMap { $0 }

        for header in headers {
            if let ref = header as? HeaderReferenceRepresentable {
                if case let .b(header) = ref.object.openAPIHeader() {
                    results[ref.id] = header
                }
            }
        }
        return results
    }

    var referencedResponseMap: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> {
        var results = OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>()

        for response in responseMap.values {
            if let ref = response as? ResponseReferenceRepresentable {
                if case let .b(response) = ref.object.openAPIResponse() {
                    results[ref.id] = response
                }
            }
        }
        return results
    }

    var referencedTags: [OpenAPITagRepresentable] {
        tags
    }
    
    var referencedSecurityRequirements: [SecurityRequirementRepresentable] {
        security?.map { $0 } ?? []
    }
}
