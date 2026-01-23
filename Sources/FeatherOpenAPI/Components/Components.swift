//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public struct Components: ComponentsRepresentable {
    
    public var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    public var parameters: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    public var examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable>
    public var responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    public var requestBodies: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    public var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    public var securitySchemes: OrderedDictionary<SecuritySchemeID, OpenAPISecuritySchemeRepresentable>
    public var links: OrderedDictionary<LinkID, OpenAPILinkRepresentable>

    public init(
        schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> = [:],
        parameters: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable> = [:],
        examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable> = [:],
        responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> = [:],
        requestBodies: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable> = [:],
        headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> = [:],
        securitySchemes: OrderedDictionary<SecuritySchemeID, OpenAPISecuritySchemeRepresentable> = [:],
        links: OrderedDictionary<LinkID, OpenAPILinkRepresentable> = [:],
    ) {
        self.schemas = schemas
        self.parameters = parameters
        self.examples = examples
        self.responses = responses
        self.requestBodies = requestBodies
        self.headers = headers
        self.securitySchemes = securitySchemes
        self.links = links
    }
}
