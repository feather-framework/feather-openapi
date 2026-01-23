//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol HeaderReferenceRepresentable {
    var id: HeaderID { get }
    var object: HeaderRepresentable { get }
}

public struct HeaderReference<T: HeaderRepresentable>:
    HeaderRepresentable,
    HeaderReferenceRepresentable
{
    public var schema: OpenAPISchemaRepresentable { object.schema }

    public var object: HeaderRepresentable {
        _object
    }

    public var id: HeaderID
    public var _object: T

    public init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    public func openAPIHeader() -> Either<JSONReference<OpenAPI.Header>, OpenAPI.Header> {
        .reference(.component(named: id.rawValue))
    }
}
