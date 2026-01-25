//
//  VariableRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI server variable.
public protocol VariableRepresentable:
    OpenAPIVariableRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{
    /// Allowed values for the variable.
    var `enum`: [String] { get }
    /// Default value for the variable.
    var `default`: String { get }
}

extension VariableRepresentable {

    /// Builds an OpenAPI server variable.
    /// - Returns: The OpenAPI server variable.
    public func openAPIServerVariable() -> OpenAPI.Server.Variable {
        .init(
            enum: `enum`,
            default: `default`,
            description: description,
            vendorExtensions: vendorExtensions
        )
    }
}
