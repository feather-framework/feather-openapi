//
//  ExampleReferenceRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 24..
//

import OpenAPIKit30

/// A type that exposes a referenced example.
public protocol ExampleReferenceRepresentable {
    /// The identifier for the example reference.
    var id: ExampleID { get }
    /// The underlying example object.
    var object: ExampleRepresentable { get }
}

/// Wrapper that exposes an example as a reusable reference.
public struct ExampleReference<T: ExampleRepresentable>:
    ExampleRepresentable,
    ExampleReferenceRepresentable
{
    /// Example summary.
    public var summary: String? { object.summary }
    /// Example value.
    public var value: AnyCodable { object.value }
    /// Example description.
    public var description: String? { object.description }
    /// Example vendor extensions.
    public var vendorExtensions: [String: AnyCodable] {
        object.vendorExtensions
    }

    /// The underlying example object.
    public var object: ExampleRepresentable {
        _object
    }

    /// The example identifier.
    public var id: ExampleID
    /// The concrete example instance.
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    /// Returns a component reference for the example.
    /// - Returns: An example reference.
    public func openAPIExample() -> Either<
        JSONReference<OpenAPI.Example>, OpenAPI.Example
    > {
        .reference(.component(named: id.rawValue))
    }
}
