//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct ComponentBuilder {

    public var components: Components

    public init(
        components: Components = .init()
    ) {
        self.components = components
    }

    public mutating func header(
        id: String,
        builder: (() -> HeaderRepresentable)
    ) -> HeaderID {
        let id = HeaderID(id)
        let header = builder()

        components.headers[id] = header

        return id
    }

    public mutating func parameter(
        id: String,
        builder: (() -> OpenAPI.Parameter)
    ) -> ParameterID {
        let id = ParameterID(id)
        let parameter = builder()

        components.parameters[id] = parameter

        return id
    }

    public mutating func schema(
        id: String,
        builder: (() -> OpenAPISchemaRepresentable)
    ) -> SchemaID {
        let id = SchemaID(id)
        let schema = builder()

        components.schemas[id] = schema

        return id
    }

    public mutating func response(
        id: String,
        builder: (() -> OpenAPIResponseRepresentable)
    ) -> ResponseID {
        let id = ResponseID(id)
        let response = builder()

        components.responses[id] = response

        return id
    }

    public mutating func requestBody(
        id: String,
        builder: (() -> OpenAPIRequestBodyRepresentable)
    ) -> RequestBodyID {
        let id = RequestBodyID(id)
        let requestBody = builder()

        components.requestBodies[id] = requestBody

        return id
    }

}
