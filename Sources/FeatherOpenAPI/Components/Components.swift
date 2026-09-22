//
//  Components.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

public import OpenAPIKit30

/// Concrete container for reusable OpenAPI components.
public struct Components: ComponentsRepresentable {

    /// Schema component map.
    public var schemas: OrderedDictionary<SchemaID, any OpenAPISchemaRepresentable>
    /// Parameter component map.
    public var parameters:
        OrderedDictionary<ParameterID, any OpenAPIParameterRepresentable>
    /// Example component map.
    public var examples:
        OrderedDictionary<ExampleID, any OpenAPIExampleRepresentable>
    /// Response component map.
    public var responses:
        OrderedDictionary<ResponseID, any OpenAPIResponseRepresentable>
    /// Request body component map.
    public var requestBodies:
        OrderedDictionary<RequestBodyID, any OpenAPIRequestBodyRepresentable>
    /// Header component map.
    public var headers: OrderedDictionary<HeaderID, any OpenAPIHeaderRepresentable>
    /// Security requirement list used by components.
    public var securityRequirements: [any SecurityRequirementRepresentable]
    /// Link component map.
    public var links: OrderedDictionary<LinkID, any OpenAPILinkRepresentable>

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
        schemas: OrderedDictionary<SchemaID, any OpenAPISchemaRepresentable> = [:],
        parameters: OrderedDictionary<
            ParameterID, any OpenAPIParameterRepresentable
        > = [:],
        examples: OrderedDictionary<ExampleID, any OpenAPIExampleRepresentable> =
            [:],
        responses: OrderedDictionary<ResponseID, any OpenAPIResponseRepresentable> =
            [:],
        requestBodies: OrderedDictionary<
            RequestBodyID, any OpenAPIRequestBodyRepresentable
        > = [:],
        headers: OrderedDictionary<HeaderID, any OpenAPIHeaderRepresentable> = [:],
        securityRequirements: [any SecurityRequirementRepresentable] = [],
        links: OrderedDictionary<LinkID, any OpenAPILinkRepresentable> = [:],
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
