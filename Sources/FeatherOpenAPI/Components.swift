//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30


public protocol ComponentsRepresentable {
    func openAPIComponents() -> OpenAPI.Components
}

extension OpenAPI.Components: ComponentsRepresentable {

    public func openAPIComponents() -> OpenAPI.Components {
        self
    }
}

// MARK: -


public struct Components: ComponentsRepresentable {

    public var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    public var parameters: OrderedDictionary<ParameterID, OpenAPI.Parameter>
    public var examples: OrderedDictionary<ExampleID, ExampleRepresentable>
    public var responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    public var requestBodies:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    public var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    public var securitySchemes:
        OrderedDictionary<SecuritySchemeID, SecuritySchemeRepresentable>
    public var links: OrderedDictionary<LinkID, LinkRepresentable>
    //    public var callbacks: OrderedDictionary<CallbackID, CallbackRepresentable>
    public var vendorExtensions: [String: AnyCodable]

    public init(
        schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> = [:],
        parameters: OrderedDictionary<ParameterID, OpenAPI.Parameter> = [:],
        examples: OrderedDictionary<ExampleID, ExampleRepresentable> = [:],
        responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> = [:],
        requestBodies: OrderedDictionary<
            RequestBodyID, OpenAPIRequestBodyRepresentable
        > = [:],
        headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> = [:],
        securitySchemes: OrderedDictionary<
            SecuritySchemeID, SecuritySchemeRepresentable
        > = [:],
        links: OrderedDictionary<LinkID, LinkRepresentable> = [:],
        //        callbacks: OrderedDictionary<CallbackID, CallbackRepresentable> = [:],
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.schemas = schemas
        self.parameters = parameters
        self.examples = examples
        self.responses = responses
        self.requestBodies = requestBodies
        self.headers = headers
        self.securitySchemes = securitySchemes
        self.links = links
        //        self.callbacks = callbacks
        self.vendorExtensions = vendorExtensions
    }

    func openAPISchemas() -> OpenAPI.ComponentDictionary<JSONSchema> {
        var result: OpenAPI.ComponentDictionary<JSONSchema> = [:]

        for (key, value) in schemas {
            result[.init(stringLiteral: key.rawValue)] = value.openAPISchema()
        }
        return result
    }

    func openAPIResponses() -> OpenAPI.ComponentDictionary<OpenAPI.Response> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Response> = [:]

        for (key, value) in responses {
            result[.init(stringLiteral: key.rawValue)] = value.openAPIResponse()
        }
        return result
    }

    func openAPIParameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Parameter> = [:]

        for (key, value) in parameters {
            result[.init(stringLiteral: key.rawValue)] = value
        }
        return result
    }

    func openAPIExamples() -> OpenAPI.ComponentDictionary<OpenAPI.Example> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Example> = [:]

        for (key, value) in examples {
            result[.init(stringLiteral: key.rawValue)] = value.openAPIExample()
        }
        return result
    }

    func openAPIRequestBodies() -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Request> = [:]

        for (key, value) in requestBodies {
            result[.init(stringLiteral: key.rawValue)] =
                value.openAPIRequestBody()
        }
        return result
    }

    func openAPIHeaders() -> OpenAPI.ComponentDictionary<OpenAPI.Header> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Header> = [:]

        for (key, value) in headers {
            result[.init(stringLiteral: key.rawValue)] = value.openAPIHeader()
        }
        return result
    }

    func openAPISecuritySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme> = [:]

        for (key, value) in securitySchemes {
            result[.init(stringLiteral: key.rawValue)] =
                value.openAPISecurityScheme()
        }
        return result
    }

    func openAPILinks() -> OpenAPI.ComponentDictionary<OpenAPI.Link> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Link> = [:]

        for (key, value) in links {
            result[.init(stringLiteral: key.rawValue)] = value.openAPILink()
        }
        return result
    }

    //    func openAPICallbacks() -> OpenAPI.ComponentDictionary<Callback> {
    //        var result: OpenAPI.ComponentDictionary<Callback> = [:]
    //
    //        for (key, value) in callbacks {
    //            result[.init(stringLiteral: key.rawValue)] = value.openAPICallback()
    //        }
    //        return result
    //    }

    public func openAPIComponents() -> OpenAPI.Components {
        .init(
            schemas: openAPISchemas(),
            responses: openAPIResponses(),
            parameters: openAPIParameters(),
            examples: openAPIExamples(),
            requestBodies: openAPIRequestBodies(),
            headers: openAPIHeaders(),
            securitySchemes: openAPISecuritySchemes(),
            links: openAPILinks(),
            callbacks: .init(),
            vendorExtensions: vendorExtensions
        )
    }

}
