//
//  Petstore+Security.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

struct PetstoreAuthSecurityScheme: SecuritySchemeRepresentable {

    var type: OpenAPI.SecurityScheme.SecurityType {
        .oauth2(
            flows: .init(
                implicit: .init(
                    authorizationUrl: URL(
                        string: "https://petstore3.swagger.io/oauth/authorize"
                    )!,
                    refreshUrl: nil,
                    scopes: [
                        "write:pets": "modify pets in your account",
                        "read:pets": "read your pets",
                    ]
                )
            )
        )
    }
}

struct ApiKeySecurityScheme: SecuritySchemeRepresentable {
    var type: OpenAPI.SecurityScheme.SecurityType {
        .apiKey(
            name: "api_key",
            location: .header
        )
    }
}

struct PetstoreAuthSecurityRequirement: SecurityRequirementRepresentable {
    var security: any SecuritySchemeRepresentable {
        PetstoreAuthSecurityScheme()
    }
    var requirements: [String] {
        [
            "write:pets",
            "read:pets",
        ]
    }
}

struct ApiKeySecurityRequirement: SecurityRequirementRepresentable {
    var security: any SecuritySchemeRepresentable {
        ApiKeySecurityScheme()
    }
}
