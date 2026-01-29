//
//  SecurityRequirementRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes a security requirement for an operation or document.
public protocol SecurityRequirementRepresentable:
    OpenAPISecurityRequirementRepresentable
{
    /// The referenced security scheme.
    var security: any SecuritySchemeRepresentable { get }
    /// The required scopes or requirements.
    var requirements: [String] { get }
}

extension SecurityRequirementRepresentable {

    /// Default requirements are empty.
    public var requirements: [String] { [] }

    //[JSONReference<SecurityScheme>: [String]]
    /// Builds an OpenAPI security requirement.
    /// - Returns: The OpenAPI security requirement.
    public func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement {
        [
            .component(named: security.openAPIIdentifier): requirements
        ]
    }
}
