//
//  ExampleModel+Parameters.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

import FeatherOpenAPI

extension Example.Model {

    struct IdParameter: PathParameterRepresentable {
        var name: String { "id" }
        var description: String? { "Example parameter" }
        var schema: any OpenAPISchemaRepresentable {
            IdSchema().reference()
        }
    }

    struct CustomRequestHeaderParameter: HeaderParameterRepresentable {
        var name: String { "CustomRequestHeader" }
        var description: String? { "Example request header parameter" }
        var schema: any OpenAPISchemaRepresentable {
            CustomHeaderSchema().reference()
        }
    }
}
