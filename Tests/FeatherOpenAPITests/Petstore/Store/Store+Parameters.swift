//
//  Store+Parameters.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Store {

    struct OrderIdParameter: PathParameterRepresentable {
        var name: String { "orderId" }
        var description: String? { "ID of order that needs to be fetched" }
        var schema: any OpenAPISchemaRepresentable {
            OrderIdSchema()
        }
    }

    struct OrderIdDeleteParameter: PathParameterRepresentable {
        var name: String { "orderId" }
        var description: String? {
            "ID of the order that needs to be deleted"
        }
        var schema: any OpenAPISchemaRepresentable {
            OrderIdSchema()
        }
    }
}
