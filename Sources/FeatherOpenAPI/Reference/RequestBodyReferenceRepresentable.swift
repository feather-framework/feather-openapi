//
//  RequestBodyReferenceRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that exposes a referenced request body.
public protocol RequestBodyReferenceRepresentable {
    /// The identifier for the request body reference.
    var id: RequestBodyID { get }
    /// The underlying request body object.
    var object: RequestBodyRepresentable { get }
}

/// Wrapper that exposes a request body as a reusable reference.
public struct RequestBodyReference<T: RequestBodyRepresentable>:
    RequestBodyRepresentable,
    RequestBodyReferenceRepresentable
{
    /// Request body content map.
    public var contentMap: ContentMap { object.contentMap }

    /// The underlying request body object.
    public var object: RequestBodyRepresentable {
        _object
    }

    /// The request body identifier.
    public var id: RequestBodyID
    /// The concrete request body instance.
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    /// Returns a component reference for the request body.
    /// - Returns: A request body reference.
    public func openAPIRequestBody() -> Either<
        JSONReference<OpenAPI.Request>, OpenAPI.Request
    > {
        .reference(.component(named: id.rawValue))
    }
}
