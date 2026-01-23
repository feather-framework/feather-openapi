//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ComponentsRepresentable:
    OpenAPIComponentsRepresentable,
    VendorExtensionsProperty
{

    var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> { get }
    var parameters: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable> { get }
    var examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable> { get }
    var responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> { get }
    var requestBodies: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable> { get }
    var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> { get }
    var securitySchemes: OrderedDictionary<SecuritySchemeID, OpenAPISecuritySchemeRepresentable> { get }
    var links: OrderedDictionary<LinkID, OpenAPILinkRepresentable> { get }
    //    public var callbacks: OrderedDictionary<CallbackID, CallbackRepresentable>

    func openAPISchemas() -> OpenAPI.ComponentDictionary<JSONSchema>
    func openAPIParameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
    func openAPIExamples() -> OpenAPI.ComponentDictionary<OpenAPI.Example>
    func openAPIResponses() -> OpenAPI.ComponentDictionary<OpenAPI.Response>
    func openAPIRequestBodies() -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    func openAPIHeaders() -> OpenAPI.ComponentDictionary<OpenAPI.Header>
    func openAPISecuritySchemes() -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    func openAPILinks() -> OpenAPI.ComponentDictionary<OpenAPI.Link>
}

public extension ComponentsRepresentable {
    
    var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> { [:] }
    var parameters: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable> { [:] }
    var examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable> { [:] }
    var responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> { [:] }
    var requestBodies: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable> { [:] }
    var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> { [:] }
    var securitySchemes: OrderedDictionary<SecuritySchemeID, OpenAPISecuritySchemeRepresentable> { [:] }
    var links: OrderedDictionary<LinkID, OpenAPILinkRepresentable> { [:] }
    

    func openAPISchemas() -> OpenAPI.ComponentDictionary<JSONSchema> {
        var result: OpenAPI.ComponentDictionary<JSONSchema> = [:]

        for (key, value) in schemas {
            result[.init(stringLiteral: key.rawValue)] = value.openAPISchema()
        }
        return result
    }
    
    func openAPIParameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Parameter> = [:]

        for (key, value) in parameters {
            result[.init(stringLiteral: key.rawValue)] = value.openAPIParameter()
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
    
    func openAPIResponses() -> OpenAPI.ComponentDictionary<OpenAPI.Response> {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Response> = [:]

        for (key, value) in responses {
            result[.init(stringLiteral: key.rawValue)] = value.openAPIResponse()
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

    func openAPIComponents() -> OpenAPI.Components {
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
