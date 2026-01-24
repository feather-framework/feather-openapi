//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Store {

    struct OrderIdSchema: Int64SchemaRepresentable {
        var example: Int64? { 10 }
    }

    struct OrderPetIdSchema: Int64SchemaRepresentable {
        var example: Int64? { 198772 }
    }

    struct OrderQuantitySchema: Int32SchemaRepresentable {
        var example: Int32? { 7 }
    }

    struct OrderShipDateSchema: StringSchemaRepresentable {
    }

    struct OrderStatusSchema: StringSchemaRepresentable {
        var description: String? { "Order Status" }
        var allowedValues: [String]? {
            [
                "placed",
                "approved",
                "delivered",
            ]
        }
        var example: String? { "approved" }
    }

    struct OrderCompleteSchema: BoolSchemaRepresentable {
    }

    struct OrderSchema: ObjectSchemaRepresentable {
        var propertyMap: SchemaMap {
            [
                "id": OrderIdSchema(),
                "petId": OrderPetIdSchema(),
                "quantity": OrderQuantitySchema(),
                "shipDate": OrderShipDateSchema(),
                "status": OrderStatusSchema(),
                "complete": OrderCompleteSchema(),
            ]
        }
    }
}
