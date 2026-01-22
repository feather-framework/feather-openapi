//
//  File.swift
//
//  Created by gerp83 on 28/08/2024
//

import OpenAPIKit30

public protocol FormBody: RequestBody {
    static var description: String { get }
    static var schema: Schema.Type { get }
    static var required: Bool { get }
}

public extension FormBody {

    static var required: Bool { true }

    static func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: description,
            content: [
                .form: .init(
                    schemaReference: .component(
                        named: schema.id
                    )
                )
            ],
            required: required,
        )
    }
}
