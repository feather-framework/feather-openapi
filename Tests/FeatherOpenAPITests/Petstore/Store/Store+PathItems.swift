//
//  Store+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22.
//

import FeatherOpenAPI

extension Petstore.Store {

    struct InventoryPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { InventoryOperation() }
    }

    struct OrderPathItem: PathItemRepresentable {
        var post: any OperationRepresentable? { PlaceOrderOperation() }
    }

    struct OrderIdentifiedPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { GetOrderOperation() }
        var delete: any OperationRepresentable? { DeleteOrderOperation() }
    }
}
