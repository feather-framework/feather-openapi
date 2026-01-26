//
//  ComponentsRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// A type that can describe reusable OpenAPI components.
public protocol ComponentsRepresentable:
    OpenAPIComponentsRepresentable,
    VendorExtensionsProperty
{
    /// Schema component map.
    var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> { get }
    /// Parameter component map.
    var parameters:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    { get }
    /// Example component map.
    var examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable> {
        get
    }
    /// Response component map.
    var responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> {
        get
    }
    /// Request body component map.
    var requestBodies:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    { get }
    /// Header component map.
    var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> { get }
    /// Security requirements used by the document.
    var securityRequirements: [SecurityRequirementRepresentable] { get }
    /// Link component map.
    var links: OrderedDictionary<LinkID, OpenAPILinkRepresentable> { get }
    //    public var callbacks: OrderedDictionary<CallbackID, CallbackRepresentable>

    /// Produces the OpenAPI schema components.
    /// - Returns: A component dictionary of JSON schemas.
    func openAPISchemas() -> OpenAPI.ComponentDictionary<JSONSchema>
    /// Produces the OpenAPI parameter components.
    /// - Returns: A component dictionary of parameters.
    func openAPIParameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
    /// Produces the OpenAPI example components.
    /// - Returns: A component dictionary of examples.
    func openAPIExamples() -> OpenAPI.ComponentDictionary<OpenAPI.Example>
    /// Produces the OpenAPI response components.
    /// - Returns: A component dictionary of responses.
    func openAPIResponses() -> OpenAPI.ComponentDictionary<OpenAPI.Response>
    /// Produces the OpenAPI request body components.
    /// - Returns: A component dictionary of requests.
    func openAPIRequestBodies() -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    /// Produces the OpenAPI header components.
    /// - Returns: A component dictionary of headers.
    func openAPIHeaders() -> OpenAPI.ComponentDictionary<OpenAPI.Header>
    /// Produces the OpenAPI security scheme components.
    /// - Returns: A component dictionary of security schemes.
    func openAPISecuritySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    /// Produces the OpenAPI link components.
    /// - Returns: A component dictionary of links.
    func openAPILinks() -> OpenAPI.ComponentDictionary<OpenAPI.Link>
}

extension ComponentsRepresentable {

    /// Default implementation for building schema components.
    /// - Returns: A component dictionary of JSON schemas.
    public func openAPISchemas() -> OpenAPI.ComponentDictionary<JSONSchema> {
        var result: OpenAPI.ComponentDictionary<JSONSchema> = [:]

        for (key, value) in schemas {
            result[.init(stringLiteral: key.rawValue)] = value.openAPISchema()
        }
        return result
    }

    /// Default implementation for building parameter components.
    /// - Returns: A component dictionary of parameters.
    public func openAPIParameters()
        -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Parameter> = [:]

        for (key, value) in parameters {
            if let parameter = value.openAPIParameter().b {
                result[.init(stringLiteral: key.rawValue)] = parameter
            }
        }
        return result
    }

    /// Default implementation for building example components.
    /// - Returns: A component dictionary of examples.
    public func openAPIExamples()
        -> OpenAPI.ComponentDictionary<OpenAPI.Example>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Example> = [:]

        for (key, value) in examples {
            if let example = value.openAPIExample().b {
                result[.init(stringLiteral: key.rawValue)] = example
            }
        }
        return result
    }

    /// Default implementation for building response components.
    /// - Returns: A component dictionary of responses.
    public func openAPIResponses()
        -> OpenAPI.ComponentDictionary<OpenAPI.Response>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Response> = [:]

        for (key, value) in responses {
            if let response = value.openAPIResponse().b {
                result[.init(stringLiteral: key.rawValue)] = response
            }
        }
        return result
    }

    /// Default implementation for building request body components.
    /// - Returns: A component dictionary of requests.
    public func openAPIRequestBodies()
        -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Request> = [:]

        for (key, value) in requestBodies {
            if let requestBody = value.openAPIRequestBody().b {
                result[.init(stringLiteral: key.rawValue)] = requestBody
            }
        }
        return result
    }

    /// Default implementation for building header components.
    /// - Returns: A component dictionary of headers.
    public func openAPIHeaders() -> OpenAPI.ComponentDictionary<OpenAPI.Header>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.Header> = [:]

        for (key, value) in headers {
            if let header = value.openAPIHeader().b {
                result[.init(stringLiteral: key.rawValue)] = header
            }
        }
        return result
    }

    /// Default implementation for building security scheme components.
    /// - Returns: A component dictionary of security schemes.
    public func openAPISecuritySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    {
        var result: OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme> = [:]
        for requirement in securityRequirements {
            let scheme = requirement.security
            result[.init(stringLiteral: scheme.openAPIIdentifier)] =
                scheme.openAPISecurityScheme()
        }
        return result
    }

    /// Default implementation for building link components.
    /// - Returns: A component dictionary of links.
    public func openAPILinks() -> OpenAPI.ComponentDictionary<OpenAPI.Link> {
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

    /// Builds an OpenAPI components object.
    /// - Returns: The OpenAPI components.
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
