//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    struct GetOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Update an existing pet." }
        var description: String? { "Update an existing pet by Id." }
        var operationId: String? { "updatePet" }
        var parameters: [ParameterRepresentable] {
            [
                IdParameter().reference(),
            ]
        }
        var responseMap: ResponseMap {
            [
                200: DetailResponse().reference(),
            ]
        }
    }
}
