//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol SecurityRequirementRepresentable {

    // [JSONReference<SecuritySdcheme>: [String]]
    func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement
}

public struct SecurityRequirement: SecurityRequirementRepresentable {

    public var requirements: [String: [String]]

    public init(
        _ requirements: [String: [String]]
    ) {
        self.requirements = requirements
    }

    //[JSONReference<SecurityScheme>: [String]]
    public func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement {
        var result: [JSONReference<OpenAPI.SecurityScheme>: [String]] = [:]
        for (key, value) in self.requirements {
            result[.component(named: key)] = value
        }
        return result
    }
}
