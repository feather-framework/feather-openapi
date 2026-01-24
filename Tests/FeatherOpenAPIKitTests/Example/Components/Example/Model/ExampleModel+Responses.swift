//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI
import OpenAPIKit30

extension Example.Model {

    struct CustomResponse: ResponseRepresentable {
        var description: String { "Example" }
        var contentMap: ContentMap {
            [
                .xml: Content(DetailSchema())
            ]
        }
    }

    struct DetailResponse: JSONResponseRepresentable {
        var description: String { "Example" }
        var schema: DetailSchema { DetailSchema() }
        var headerMap: HeaderMap {
            [
                "X-Custom-Response-Header": CustomResponseHeader().reference()
            ]
        }
    }
}
