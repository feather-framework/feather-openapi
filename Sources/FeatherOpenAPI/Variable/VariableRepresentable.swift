//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol VariableRepresentable:
    OpenAPIVariableRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    var `enum`: [String] { get }
    var `default`: String { get }
}

public extension VariableRepresentable {

    func openAPIServerVariable() -> OpenAPI.Server.Variable {
        .init(
            enum: `enum`,
            default: `default`,
            description: description,
            vendorExtensions: vendorExtensions
        )
    }
}
