//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit30

// shared operation security
extension Operation {

    static func bearerToken() -> [OpenAPI.SecurityRequirement] {
        Example.Model.SecuritySchemes.BearerToken.securityRequirement()
    }
}

extension Example.Model {

    static var securitySchemes: [SecurityScheme.Type] {
        [
            SecuritySchemes.BearerToken.self
        ]
    }

    enum SecuritySchemes {

        enum BearerToken: SecurityScheme {

            static func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
                .init(
                    type: .http(
                        scheme: "bearer",
                        bearerFormat: "token"
                    ),
                    description: "Authorization header using a Bearer token"
                )
            }
        }
    }
}
