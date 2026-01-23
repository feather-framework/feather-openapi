//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30


public protocol OperationRepresentable:
    OpenAPIOperationRepresentable,
    ReferencedSchemaMapRepresentable
{
//    associatedtype RequestBodyType: RequestBodyRepresentable
    
//    var tags: [String]?
    var summary: String? { get }
    var description: String? { get }
    var operationId: String? { get }

    var parameters: [ParameterRepresentable] { get }
    var requestBody: RequestBodyRepresentable? { get }
    var responseMap: ResponseMap { get }

    var deprecated: Bool { get }
//    var security: [SecurityRequirementRepresentable]?
//    var servers: [ServerRepresentable]?
}

public extension OperationRepresentable {

    var summary: String? { nil }
    var description: String? { nil }
    var operationId: String? { nil }
    var parameters: [ParameterRepresentable] { [] }

    var requestBody: RequestBodyRepresentable? { nil }
    
    var deprecated: Bool { false }
    
    func openAPIOperation() -> OpenAPI.Operation {
        .init(
            tags: nil,
            summary: summary,
            description: description,
            externalDocs: nil,
            operationId: operationId,
            parameters: parameters.map { .init($0.openAPIParameter()) },
            requestBody: requestBody?.openAPIRequestBody(),
            responses: responseMap.mapValues { .init($0.openAPIResponse()) },
            callbacks: [:],
            deprecated: deprecated,
            security: nil,
            servers: nil,
            vendorExtensions: [:]
        )
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        
        for parameter in parameters {
            if let ref = parameter.schema as? SchemaReferenceRepresentable {
                results[ref.id] = ref.object
            }
        }
        
        for content in requestBody?.contentMap.values ?? [] {
            if let ref = content.schema as? SchemaReferenceRepresentable {
                results[ref.id] = ref.object
            }
        }

        let headers = responseMap.values
            .map { $0.headerMap.values }
            .flatMap { $0 }
        
        let contents = responseMap.values
            .map { $0.contentMap.values }
            .flatMap { $0 }

        for content in contents {
            for (k, v) in content.referencedSchemaMap {
                results[k] = v
            }
        }

        return results
    }
}
