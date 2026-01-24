//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol ResponseReferenceRepresentable {
    var id: ResponseID { get }
    var object: ResponseRepresentable { get }
}

public struct ResponseReference<T: ResponseRepresentable>:
    ResponseRepresentable,
    ResponseReferenceRepresentable
{
    public var description: String { object.description }
    public var headerMap: HeaderMap { object.headerMap }
    public var contentMap: ContentMap { object.contentMap }

    public var object: ResponseRepresentable {
        _object
    }

    public var id: ResponseID
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    public func openAPIResponse() -> Either<JSONReference<OpenAPI.Response>, OpenAPI.Response> {
        .reference(.component(named: id.rawValue))
    }
}
