//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPISecurityScheme: Identifiable {
    static func openAPISecurityScheme() -> OpenAPI.SecurityScheme
}

public extension OpenAPISecurityScheme {

    static func securityRequirement() -> [OpenAPI.SecurityRequirement] {
        [
            [
                reference(): []
            ]
        ]
    }

    static func reference() -> JSONReference<OpenAPI.SecurityScheme> {
        .component(named: id)
    }
}

public protocol SecurityScheme: OpenAPISecurityScheme {

}
