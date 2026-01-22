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
    ) -> (id: HeaderID, value: HeaderRepresentable) {
        let header = builder()

        components.headers[.init(id)] = header

        return (id: .init(id), value: header)
    }

    public mutating func parameter(
        id: String,
        builder: (() -> OpenAPI.Parameter)
    ) -> (id: ParameterID, value: OpenAPI.Parameter) {
        let parameter = builder()

        components.parameters[.init(id)] = parameter

        return (id: .init(id), value: parameter)
    }

    public mutating func schema(
        id: String,
        builder: (() -> SchemaRepresentable)
    ) -> (id: SchemaID, value: SchemaRepresentable) {
        let schema = builder()

        if components.schemas[.init(id)] != nil {
            print("Schema `\(id)` is already registered...")
        }

        components.schemas[.init(id)] = schema

        return (id: .init(id), value: schema)
    }

    public mutating func response(
        id: String,
        builder: (() -> ResponseRepresentable)
    ) -> (id: ResponseID, value: ResponseRepresentable) {
        let response = builder()

        components.responses[.init(id)] = response

        return (id: .init(id), value: response)
    }

    public mutating func requestBody(
        id: String,
        builder: (() -> RequestBodyRepresentable)
    ) -> (id: RequestBodyID, value: RequestBodyRepresentable) {
        let requestBody = builder()

        components.requestBodies[.init(id)] = requestBody

        return (id: .init(id), value: requestBody)
    }

    public mutating func addSchema(
        id: String,
        builder: (() -> SchemaRepresentable)
    ) -> (id: SchemaID, value: SchemaRepresentable) {
        let schema = builder()

        components.schemas[.init(id)] = schema

        return (id: .init(id), value: schema)
    }

    public mutating func getSchema(
        id: String
    ) throws(ComponentBuilderError) -> (
        id: SchemaID, value: SchemaRepresentable
    ) {
        guard let schema = components.schemas[.init(id)] else {
            throw .missingSchema(id)
        }
        return (id: .init(id), value: schema)
    }

    public mutating func getSchemaID(
        _ id: String
    ) throws(ComponentBuilderError) -> SchemaID {
        guard components.schemas[.init(id)] != nil else {
            throw .missingSchema(id)
        }
        return .init(id)
    }
}

public enum ComponentBuilderError: Error {
    case missingSchema(String)
}
