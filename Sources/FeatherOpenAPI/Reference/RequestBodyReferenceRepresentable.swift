//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol RequestBodyReferenceRepresentable {
    var id: RequestBodyID { get }
    var object: RequestBodyRepresentable { get }
}

public struct RequestBodyReference<T: RequestBodyRepresentable>:
    RequestBodyRepresentable,
    RequestBodyReferenceRepresentable
{
    public var contentMap: ContentMap { object.contentMap }

    public var object: RequestBodyRepresentable {
        _object
    }

    public var id: RequestBodyID
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    public func openAPIRequestBody() -> Either<JSONReference<OpenAPI.Request>, OpenAPI.Request> {
        .reference(.component(named: id.rawValue))
    }
}
