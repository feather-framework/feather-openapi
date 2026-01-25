//
//  ExampleModel+Responses.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

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
                .xml: Content(DetailSchema().reference())
            ]
        }
    }

    struct DetailResponse: JSONResponseRepresentable {
        var description: String { "Example" }
        var schema: SchemaReference<DetailSchema> { DetailSchema().reference() }
        var headerMap: HeaderMap {
            [
                "X-Custom-Response-Header": CustomResponseHeader().reference()
            ]
        }
    }
}
