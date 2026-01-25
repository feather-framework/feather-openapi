//
//  Pet+Parameters.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    struct IdParameter: PathParameterRepresentable {
        var name: String { "petId" }
        var description: String? { "ID of pet to return" }
        var required: Bool { true }
        var schema: any OpenAPISchemaRepresentable {
            IdSchema().reference()
        }
    }
}
