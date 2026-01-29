//
//  ResponseReferenceRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that exposes a referenced response.
public protocol ResponseReferenceRepresentable {
    /// The identifier for the response reference.
    var id: ResponseID { get }
    /// The underlying response object.
    var object: ResponseRepresentable { get }
}

/// Wrapper that exposes a response as a reusable reference.
public struct ResponseReference<T: ResponseRepresentable>:
    ResponseRepresentable,
    ResponseReferenceRepresentable
{
    /// Response description.
    public var description: String { object.description }
    /// Response header map.
    public var headerMap: HeaderMap { object.headerMap }
    /// Response content map.
    public var contentMap: ContentMap { object.contentMap }

    /// The underlying response object.
    public var object: ResponseRepresentable {
        _object
    }

    /// The response identifier.
    public var id: ResponseID
    /// The concrete response instance.
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    /// Returns a component reference for the response.
    /// - Returns: A response reference.
    public func openAPIResponse() -> Either<
        JSONReference<OpenAPI.Response>, OpenAPI.Response
    > {
        .reference(.component(named: id.rawValue))
    }
}
