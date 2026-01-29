//
//  Pet+Responses.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    struct PetResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(PetSchema().reference()),
                .xml: Content(PetSchema().reference()),
            ]
        }
    }

    struct PetListResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(PetListSchema()),
                .xml: Content(PetListSchema()),
            ]
        }
    }

    struct ApiResponseJSONResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(
                    Petstore.ApiResponse.ApiResponseSchema().reference()
                )
            ]
        }
    }

    struct EmptyResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap { [:] }
    }
}
