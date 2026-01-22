//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    enum Parameters {

        enum Id: PathParameter {
            static let name = "petId"
            static let description = "ID of pet to return"
            static var required: Bool { true }
            static var schema: Schema.Type { Schemas.Pet.Id.self }
        }
    }
}
