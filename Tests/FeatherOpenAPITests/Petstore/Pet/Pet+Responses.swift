//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    struct DetailResponse: ResponseRepresentable {
        var description: String { "Successful operation" }
        var contentMap: ContentMap {
            [
                .json: Content(Schema()),
                .xml: Content(Schema()),
            ]
        }
    }
}
