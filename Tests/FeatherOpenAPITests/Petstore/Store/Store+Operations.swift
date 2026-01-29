//
//  Store+Operations.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Store {

    struct InventoryOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [StoreTag()] }
        var summary: String? { "Returns pet inventories by status." }
        var description: String? {
            "Returns a map of status codes to quantities."
        }
        var operationId: String? { "getInventory" }
        var responseMap: ResponseMap {
            [
                200: InventoryResponse(description: "successful operation"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                ApiKeySecurityRequirement()
            ]
        }
    }

    struct PlaceOrderOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [StoreTag()] }
        var summary: String? { "Place an order for a pet." }
        var description: String? { "Place a new order in the store." }
        var operationId: String? { "placeOrder" }
        var requestBody: RequestBodyRepresentable? {
            PlaceOrderRequestBody()
        }
        var responseMap: ResponseMap {
            [
                200: OrderJSONResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid input"),
                422: EmptyResponse(description: "Validation exception"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct GetOrderOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [StoreTag()] }
        var summary: String? { "Find purchase order by ID." }
        var description: String? {
            "For valid response try integer IDs with value <= 5 or > 10. Other values will generate exceptions."
        }
        var operationId: String? { "getOrderById" }
        var parameters: [ParameterRepresentable] {
            [
                OrderIdParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: OrderResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid ID supplied"),
                404: EmptyResponse(description: "Order not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct DeleteOrderOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [StoreTag()] }
        var summary: String? { "Delete purchase order by identifier." }
        var description: String? {
            "For valid response try integer IDs with value < 1000. Anything above 1000 or non-integers will generate API errors."
        }
        var operationId: String? { "deleteOrder" }
        var parameters: [ParameterRepresentable] {
            [
                OrderIdDeleteParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: EmptyResponse(description: "order deleted"),
                400: EmptyResponse(description: "Invalid ID supplied"),
                404: EmptyResponse(description: "Order not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }
}
