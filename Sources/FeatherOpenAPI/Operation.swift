//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol OperationRepresentable {
    func openAPIOperation() -> OpenAPI.Operation
}


extension OpenAPI.Operation: OperationRepresentable {

    public func openAPIOperation() -> OpenAPI.Operation {
        self
    }
}

// MARK: -

public struct Operation: OperationRepresentable {

    public var tags: [String]?
    public var summary: String?
    public var description: String?
    public var externalDocs: ExternalDocumentationRepresentable?
    public var operationId: String?

    public var parameters: [ParameterID]
    public var requestBody: RequestBodyID?
    public var responses:
        OrderedDictionary<OpenAPI.Response.StatusCode, ResponseID>

    public var deprecated: Bool
    public var security: [SecurityRequirementRepresentable]?
    public var servers: [ServerRepresentable]?
    public var vendorExtensions: [String: AnyCodable]

    public init(
        id: String? = nil,
        tags: [String]? = nil,
        summary: String? = nil,
        description: String? = nil,
        externalDocs: ExternalDocumentationRepresentable? = nil,
        parameters: [ParameterID] = [],
        requestBody: RequestBodyID? = nil,
        responses: OrderedDictionary<OpenAPI.Response.StatusCode, ResponseID>,
        deprecated: Bool = false,
        security: [SecurityRequirementRepresentable]? = nil,
        servers: [ServerRepresentable]? = nil,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.tags = tags
        self.summary = summary
        self.description = description
        self.externalDocs = externalDocs
        self.operationId = id
        self.parameters = parameters
        self.requestBody = requestBody
        self.responses = responses
        self.deprecated = deprecated
        self.security = security
        self.servers = servers
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIOperation() -> OpenAPI.Operation {
        if let requestBody {
            return .init(
                tags: tags,
                summary: summary,
                description: description,
                externalDocs: externalDocs?.openAPIExternalDocumentation(),
                operationId: operationId,
                parameters: parameters.map {
                    .reference(.component(named: $0.rawValue))
                },
                requestBody: .reference(
                    .component(
                        named: requestBody.rawValue
                    )
                ),
                responses: responses.mapValues {
                    .reference(.component(named: $0.rawValue))
                },
                callbacks: .init(),
                deprecated: deprecated,
                security: security?.map { $0.openAPISecurityRequirement() },
                servers: servers?.map { $0.openAPIServer() },
                vendorExtensions: vendorExtensions
            )
        }
        return .init(
            tags: tags,
            summary: summary,
            description: description,
            externalDocs: externalDocs?.openAPIExternalDocumentation(),
            operationId: operationId,
            parameters: parameters.map {
                .reference(.component(named: $0.rawValue))
            },
            responses: responses.mapValues {
                .reference(.component(named: $0.rawValue))
            },
            callbacks: .init(),
            deprecated: deprecated,
            security: security?.map { $0.openAPISecurityRequirement() },
            servers: servers?.map { $0.openAPIServer() },
            vendorExtensions: vendorExtensions
        )
    }
}
