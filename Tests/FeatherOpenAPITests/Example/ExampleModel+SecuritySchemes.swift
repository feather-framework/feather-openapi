//
//  ExampleModel+SecuritySchemes.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

import FeatherOpenAPI
import OpenAPIKit30

extension Example.Model {

    struct BearerTokenSecurityScheme: SecuritySchemeRepresentable {
        var type: OpenAPI.SecurityScheme.SecurityType {
            .http(
                scheme: "bearer",
                bearerFormat: "token"
            )
        }
        var description: String? {
            "Authorization header using a Bearer token"
        }
    }
}
