//
//  Store+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Store {

    struct OrderIdSchema: Int64SchemaRepresentable {
        var example: Int64? { 10 }
        var required: Bool { false }
    }

    struct OrderPetIdSchema: Int64SchemaRepresentable {
        var example: Int64? { 198772 }
        var required: Bool { false }
    }

    struct OrderQuantitySchema: Int32SchemaRepresentable {
        var example: Int32? { 7 }
        var required: Bool { false }
    }

    struct OrderShipDateSchema: SchemaRepresentable {
        var required: Bool { false }
        func openAPISchema() -> JSONSchema {
            .string(
                format: .dateTime,
                required: `required`,
                nullable: nullable,
                permissions: nil,
                deprecated: deprecated,
                title: title,
                description: description,
                discriminator: nil,
                externalDocs: nil,
                minLength: nil,
                maxLength: nil,
                pattern: nil,
                allowedValues: nil,
                defaultValue: nil,
                example: nil
            )
        }
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
        var required: Bool { false }
    }

    struct OrderCompleteSchema: BoolSchemaRepresentable {
        var required: Bool { false }
    }

    struct OrderSchema: ObjectSchemaRepresentable {
        var openAPIIdentifier: String { "Order" }
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

    struct InventorySchema: SchemaRepresentable {
        func openAPISchema() -> JSONSchema {
            .object(
                format: .generic,
                required: `required`,
                nullable: nullable,
                permissions: nil,
                deprecated: deprecated,
                title: title,
                description: description,
                discriminator: nil,
                externalDocs: nil,
                minProperties: nil,
                maxProperties: nil,
                properties: [:],
                additionalProperties: .schema(
                    InventoryQuantitySchema().openAPISchema()
                ),
                allowedValues: nil,
                defaultValue: nil,
                example: nil
            )
        }
    }

    struct InventoryQuantitySchema: Int32SchemaRepresentable {
    }
}
