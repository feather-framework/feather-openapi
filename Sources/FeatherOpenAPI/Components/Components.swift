//
//  Components.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Concrete container for reusable OpenAPI components.
public struct Components: ComponentsRepresentable {

    /// Schema component map.
    public var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    /// Parameter component map.
    public var parameters:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    /// Example component map.
    public var examples:
        OrderedDictionary<ExampleID, OpenAPIExampleRepresentable>
    /// Response component map.
    public var responses:
        OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    /// Request body component map.
    public var requestBodies:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    /// Header component map.
    public var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    /// Security requirement list used by components.
    public var securityRequirements: [SecurityRequirementRepresentable]
    /// Link component map.
    public var links: OrderedDictionary<LinkID, OpenAPILinkRepresentable>

    /// Creates a components container.
    /// - Parameters:
    ///   - schemas: Schema component map.
    ///   - parameters: Parameter component map.
    ///   - examples: Example component map.
    ///   - responses: Response component map.
    ///   - requestBodies: Request body component map.
    ///   - headers: Header component map.
    ///   - securityRequirements: Security requirements.
    ///   - links: Link component map.
    public init(
        schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> = [:],
        parameters: OrderedDictionary<
            ParameterID, OpenAPIParameterRepresentable
        > = [:],
        examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable> =
            [:],
        responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> =
            [:],
        requestBodies: OrderedDictionary<
            RequestBodyID, OpenAPIRequestBodyRepresentable
        > = [:],
        headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> = [:],
        securityRequirements: [SecurityRequirementRepresentable] = [],
        links: OrderedDictionary<LinkID, OpenAPILinkRepresentable> = [:],
    ) {
        self.schemas = schemas
        self.parameters = parameters
        self.examples = examples
        self.responses = responses
        self.requestBodies = requestBodies
        self.headers = headers
        self.securityRequirements = securityRequirements
        self.links = links
    }
}
