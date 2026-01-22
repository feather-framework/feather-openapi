//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Store {

    enum Schemas {

        enum Order: ObjectSchema {

            enum Id: Int64Schema {
                static var example: Int? { 10 }
            }

            enum PetId: Int64Schema {
                static var example: Int? { 198772 }
            }

            enum Quantity: Int32Schema {
                static var example: Int? { 7 }
            }

            enum ShipDate: DateTimeSchema {
                static var example: String? { nil }
            }

            enum Status: EnumSchema {
                static var description: String { "Order Status" }
                static var allowedValues: [String] {
                    [
                        "placed",
                        "approved",
                        "delivered",
                    ]
                }
                static var defaultValue: String? { nil }
                static var example: String? { "approved" }
            }

            enum Complete: BooleanSchema {
            }

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("id", Id.self),
                    .init("petId", PetId.self),
                    .init("quantity", Quantity.self),
                    .init("shipDate", ShipDate.self),
                    .init("status", Status.self),
                    .init("complete", Complete.self),
                ]
            }
        }

    }
}
