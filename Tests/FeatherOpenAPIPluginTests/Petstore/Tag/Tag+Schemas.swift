//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Tag {

    enum Schemas {

        enum Tag: ObjectSchema {

            enum Id: Int64Schema {
            }

            enum Name: TextSchema {

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
