//
//  ParameterReferenceRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// A type that exposes a referenced parameter.
public protocol ParameterReferenceRepresentable {
    /// The identifier for the parameter reference.
    var id: ParameterID { get }
    /// The underlying parameter object.
    var object: ParameterRepresentable { get }
}

/// Wrapper that exposes a parameter as a reusable reference.
public struct ParameterReference<T: ParameterRepresentable>:
    ParameterRepresentable,
    ParameterReferenceRepresentable
{
    /// Parameter name.
    public var name: String { object.name }
    /// Parameter context.
    public var context: OpenAPIKit30.OpenAPI.Parameter.Context {
        object.context
    }
    /// Parameter schema.
    public var schema: any OpenAPISchemaRepresentable { object.schema }

    /// The underlying parameter object.
    public var object: ParameterRepresentable {
        _object
    }

    /// The parameter identifier.
    public var id: ParameterID
    /// The concrete parameter instance.
    public var _object: T

    internal init(
        _ object: T
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
    }

    /// Returns a component reference for the parameter.
    /// - Returns: A parameter reference.
    public func openAPIParameter() -> Either<
        JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter
    > {
        .reference(.component(named: id.rawValue))
    }
}
