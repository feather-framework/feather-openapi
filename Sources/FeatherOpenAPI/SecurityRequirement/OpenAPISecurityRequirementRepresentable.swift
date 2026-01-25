//
//  OpenAPISecurityRequirementRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that can produce an OpenAPI security requirement.
public protocol OpenAPISecurityRequirementRepresentable {

    // [JSONReference<SecuritySdcheme>: [String]]
    /// Returns the OpenAPI security requirement representation.
    /// - Returns: The OpenAPI security requirement.
    func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement
}

extension OpenAPI.SecurityRequirement: OpenAPISecurityRequirementRepresentable {

    /// Returns `self` as an OpenAPI security requirement.
    /// - Returns: The current security requirement value.
    public func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement {
        self
    }
}
