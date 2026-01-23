//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol ParameterReferenceRepresentable {
    var id: ParameterID { get }
    var object: ParameterRepresentable { get }
}

public struct ParameterReference<T: ParameterRepresentable>:
    ParameterRepresentable,
    ParameterReferenceRepresentable
{
    public var name: String { object.name }
    public var context: OpenAPIKit30.OpenAPI.Parameter.Context { object.context }
    public var schema: any OpenAPISchemaRepresentable { object.schema }
    
    public var object: ParameterRepresentable {
        _object
    }

    public var id: ParameterID
    public var _object: T
    
    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    public func openAPIParameter() -> Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter> {
        .reference(.component(named: id.rawValue))
    }
}
