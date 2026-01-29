//
//  ServerRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI server object with defaults.
public protocol ServerRepresentable:
    OpenAPIServerRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{

    /// Server URL template.
    var url: LocationRepresentable { get }

    /// Server variable definitions.
    var variables: VariableMap { get }

}

extension ServerRepresentable {

    /// Default server variables map.
    public var variables: VariableMap { .init() }

    /// Builds an OpenAPI server object.
    /// - Returns: The OpenAPI server.
    public func openAPIServer() -> OpenAPI.Server {
        .init(
            url: url.openAPILocation(),
            description: description,
            variables: variables.mapValues {
                $0.openAPIServerVariable()
            },
            vendorExtensions: vendorExtensions
        )
    }
}
