//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol SecurityRequirementRepresentable:
    OpenAPISecurityRequirementRepresentable
{
    var security: any SecuritySchemeRepresentable { get }
    var requirements: [String] { get }
}

public extension SecurityRequirementRepresentable {

    var requirements: [String] { [] }

    //[JSONReference<SecurityScheme>: [String]]
    func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement {
        [
            .component(named: security.openAPIIdentifier): requirements
        ]
    }
}
