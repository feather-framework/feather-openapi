//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ServerRepresentable:
    OpenAPIServerRepresentable,
    DescriptionProperty,
    VendorExtensionsProperty
{

    var url: LocationRepresentable { get }
    
    var variables: VariableMap { get }
    
}

public extension ServerRepresentable {

    var variables: VariableMap { .init() }
    
    func openAPIServer() -> OpenAPI.Server {
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
