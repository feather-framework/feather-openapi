//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol SecurityRequirementRepresentable: OpenAPISecurityRequirementRepresentable {

    var requirements: [String: [String]] { get }
}

public extension SecurityRequirementRepresentable {

    //[JSONReference<SecurityScheme>: [String]]
    func openAPISecurityRequirement() -> OpenAPI.SecurityRequirement {
        var result: [JSONReference<OpenAPI.SecurityScheme>: [String]] = [:]
        for (key, value) in self.requirements {
            result[.component(named: key)] = value
        }
        return result
    }
}
