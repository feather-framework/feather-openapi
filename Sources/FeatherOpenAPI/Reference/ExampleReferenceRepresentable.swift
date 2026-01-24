//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 24..
//

import OpenAPIKit30

public protocol ExampleReferenceRepresentable {
    var id: ExampleID { get }
    var object: ExampleRepresentable { get }
}

public struct ExampleReference<T: ExampleRepresentable>:
    ExampleRepresentable,
    ExampleReferenceRepresentable
{
    public var summary: String? { object.summary }
    public var value: AnyCodable { object.value }
    public var description: String? { object.description }
    public var vendorExtensions: [String: AnyCodable] { object.vendorExtensions }

    public var object: ExampleRepresentable {
        _object
    }

    public var id: ExampleID
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    public func openAPIExample() -> Either<JSONReference<OpenAPI.Example>, OpenAPI.Example> {
        .reference(.component(named: id.rawValue))
    }
}
