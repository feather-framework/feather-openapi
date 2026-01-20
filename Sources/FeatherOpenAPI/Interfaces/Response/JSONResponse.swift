//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol JSONResponse: Response {

    static var schema: Schema.Type { get }
}

public extension JSONResponse {

    static var contents: [OpenAPI.ContentType: Schema.Type] {
        [
            .json: schema
        ]
    }
}
