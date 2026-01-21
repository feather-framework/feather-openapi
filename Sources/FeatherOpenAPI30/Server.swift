//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ServerRepresentable {
    func openAPIServer() -> OpenAPI.Server
}

public struct Server: ServerRepresentable {

    public var url: URLRepresentable
    public var description: String?
    public var variables: OrderedDictionary<String, ServerVariableRepresentable>
    public var vendorExtensions: [String: AnyCodable]

    public func openAPIServer() -> OpenAPI.Server {
        .init(
            url: url.url(),
            description: description,
            variables: variables.mapValues {
                $0.openAPIServerVariable()
            },
            vendorExtensions: vendorExtensions
        )
    }
}
