//
//  Store+Responses.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Store {

    struct OrderResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(OrderSchema().reference()),
                .xml: Content(OrderSchema().reference()),
            ]
        }
    }

    struct OrderJSONResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(OrderSchema().reference())
            ]
        }
    }

    struct InventoryResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(InventorySchema())
            ]
        }
    }

    struct EmptyResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap { [:] }
    }
}
