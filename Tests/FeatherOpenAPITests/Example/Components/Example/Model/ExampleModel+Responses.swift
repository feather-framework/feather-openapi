//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI
import OpenAPIKit

extension Example.Model {

    static let responses: [Response.Type] = [
        Responses.Detail.self
    ]

    enum Responses {

        enum Custom: Response {
            static let description = "Example"
            static var contents: [OpenAPI.ContentType: Schema.Type] = [
                .xml: Schemas.Detail.self
            ]
        }

        enum Detail: JSONResponse {
            static let description = "Example"
            static var headers: [Header.Type] = [
                Headers.CustomResponseHeader.self
            ]
            static let schema: Schema.Type = Schemas.Detail.self
        }
    }
}
