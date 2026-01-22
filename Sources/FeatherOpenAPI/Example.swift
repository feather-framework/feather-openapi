//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct ExampleID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol ExampleRepresentable {
    func openAPIExample() -> OpenAPI.Example
}

public struct Example: ExampleRepresentable {

    public var summary: String?
    public var description: String?
    public var value: AnyCodable
    public var vendorExtensions: [String: AnyCodable]

    public init(
        summary: String? = nil,
        description: String? = nil,
        value: AnyCodable,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.summary = summary
        self.description = description
        self.value = value
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIExample() -> OpenAPI.Example {
        .init(
            summary: summary,
            description: description,
            value: .init(value),
            vendorExtensions: vendorExtensions
        )
    }

}
