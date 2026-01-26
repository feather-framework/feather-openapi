//
//  Store+RequestBodies.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Store {

    struct PlaceOrderRequestBody: RequestBodyRepresentable {
        var required: Bool { false }
        var contentMap: ContentMap {
            [
                .json: Content(OrderSchema().reference()),
                .xml: Content(OrderSchema().reference()),
                .form: Content(OrderSchema().reference()),
            ]
        }
    }
}
