//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    enum Operations {

        enum Get: Operation {
            static var tag: Tag.Type { Tags.Pet.self }
            static let summary = "Update an existing pet."
            static let description = "Update an existing pet by Id."
            static var operationId: String { "updatePet" }
            static var parameters: [Parameter.Type] {
                [
                    Parameters.Id.self
                ]
            }
            static var responses: [OperationResponse] {
                [
                    .init(200, Responses.Detail.self)
                ]
            }
        }

    }
}
