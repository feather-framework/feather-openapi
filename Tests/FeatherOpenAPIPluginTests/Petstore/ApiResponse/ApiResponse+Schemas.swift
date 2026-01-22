//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.ApiResponse {

    enum Schemas {

        enum ApiResponse: ObjectSchema {

            enum Code: Int32Schema {
            }

            enum `ResponseType`: TextSchema {

            }

            enum Message: TextSchema {

            }

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("code", Code.self),
                    .init("type", `ResponseType`.self),
                    .init("message", Message.self),
                ]
            }
        }

    }
}
