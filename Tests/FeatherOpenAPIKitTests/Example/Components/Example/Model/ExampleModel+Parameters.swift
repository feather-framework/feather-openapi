//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

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
