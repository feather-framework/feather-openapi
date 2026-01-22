//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPIKit

extension Petstore.Pet {

    enum Schemas {

        enum Pet: ObjectSchema {

            enum Id: Int64Schema {

                static var example: Int? { 10 }
            }

            enum Name: TextSchema {
                static var example: String? { "doggie" }
            }

            enum PhotoUrls: ArraySchema {

                enum Item: TextSchema {

                }

                static var items: any Schema.Type { Item.self }
            }

            enum Tags: ArraySchema {
                static var items: any Schema.Type {
                    Petstore.Tag.Schemas.Tag.self
                }
            }

            enum Status: EnumSchema {
                static var description: String { "pet status in the store" }
                static var allowedValues: [String] {
                    [
                        "available",
                        "pending",
                        "sold",
                    ]
                }
            }

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("id", Id.self, required: false),
                    .init("name", Name.self),
                    .init(
                        "category",
                        Petstore.Category.Schemas.Category.self,
                        required: false
                    ),
                    .init("photoUrls", PhotoUrls.self),
                    .init("tags", Tags.self, required: false),
                    .init("status", Status.self, required: false),
                ]
            }
        }
    }
}
