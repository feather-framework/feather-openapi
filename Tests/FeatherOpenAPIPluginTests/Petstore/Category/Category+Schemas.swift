//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Category {

    enum Schemas {

        enum Category: ObjectSchema {

            enum Id: Int64Schema {
                static var example: Int? { 1 }
            }

            enum Name: TextSchema {
                static var example: String? { "Dogs" }
            }

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("id", Id.self),
                    .init("name", Name.self),
                ]
            }

        }
    }
}
