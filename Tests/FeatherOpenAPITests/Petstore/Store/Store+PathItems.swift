//
//  Store+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Store {

    struct InventoryPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { InventoryOperation() }
    }

    struct OrderPathItem: PathItemRepresentable {
        var post: OperationRepresentable? { PlaceOrderOperation() }
    }

    struct OrderIdentifiedPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { GetOrderOperation() }
        var delete: OperationRepresentable? { DeleteOrderOperation() }
    }
}
