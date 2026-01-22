//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ServerVariableRepresentable {
    func openAPIServerVariable() -> OpenAPI.Server.Variable
}

public struct ServerVariable: ServerVariableRepresentable {
    public var `enum`: [String]
    public var `default`: String
    public var description: String?
    public var vendorExtensions: [String: AnyCodable]

    public func openAPIServerVariable() -> OpenAPI.Server.Variable {
        .init(
            enum: self.enum,
            default: self.default,
            description: self.description,
            vendorExtensions: self.vendorExtensions
        )
    }
}
