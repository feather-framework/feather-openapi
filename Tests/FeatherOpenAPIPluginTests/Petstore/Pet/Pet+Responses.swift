//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    enum Responses {

        enum Detail: Response {
            static let description = "Successful operation"
            //            static var headers: [Header.Type] {
            //                [
            //                    Headers.CustomResponseHeader.self
            //                ]
            //            }
            //            static var schema: Schema.Type { Schemas.Pet.self }

            static var contents: [OpenAPI.ContentType: any Schema.Type] {
                [
                    .json: Schemas.Pet.self,
                    .xml: Schemas.Pet.self,
                ]
            }
        }
    }
}
