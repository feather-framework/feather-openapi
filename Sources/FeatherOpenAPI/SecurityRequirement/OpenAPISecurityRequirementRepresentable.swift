//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol OpenAPISecurityRequirementRepresentable {

    // [JSONReference<SecuritySdcheme>: [String]]
    func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement
}

extension OpenAPI.SecurityRequirement: OpenAPISecurityRequirementRepresentable {

    public func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement {
        self
    }
}
