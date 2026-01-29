//
//  HeaderReferenceRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that exposes a referenced header.
public protocol HeaderReferenceRepresentable {
    /// The identifier for the header reference.
    var id: HeaderID { get }
    /// The underlying header object.
    var object: HeaderRepresentable { get }
}

/// Wrapper that exposes a header as a reusable reference.
public struct HeaderReference<T: HeaderRepresentable>:
    HeaderRepresentable,
    HeaderReferenceRepresentable
{
    /// Header schema.
    public var schema: OpenAPISchemaRepresentable { object.schema }

    /// The underlying header object.
    public var object: HeaderRepresentable {
        _object
    }

    /// The header identifier.
    public var id: HeaderID
    /// The concrete header instance.
    public var _object: T

    /// Creates a header reference.
    /// - Parameter object: The header to reference.
    public init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    /// Returns a component reference for the header.
    /// - Returns: A header reference.
    public func openAPIHeader() -> Either<
        JSONReference<OpenAPI.Header>, OpenAPI.Header
    > {
        .reference(.component(named: id.rawValue))
    }
}
