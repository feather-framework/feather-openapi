//
//  SchemaReference.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

/// A type that exposes a referenced schema.
public protocol SchemaReferenceRepresentable {
    /// The identifier for the schema reference.
    var id: SchemaID { get }
    /// The underlying schema object.
    var object: SchemaRepresentable { get }
}

/// Wrapper that exposes a schema as a reusable reference.
public struct SchemaReference<T: SchemaRepresentable>:
    SchemaRepresentable,
    SchemaReferenceRepresentable
{
    /// The underlying schema object.
    public var object: any SchemaRepresentable {
        _object
    }

    /// The schema identifier.
    public var id: SchemaID
    /// The concrete schema instance.
    public var _object: T
    /// Indicates whether the reference is required.
    public var required: Bool

    internal init(
        _ object: T,
        required: Bool = true
    ) {
        self.id = .init(object.openAPIIdentifier)
        self._object = object
        self.required = required
    }

    /// Returns a JSON Schema reference to the component.
    /// - Returns: The JSON schema reference.
    public func openAPISchema() -> JSONSchema {
        .reference(.component(named: id.rawValue), required: required)
    }

    /// Referenced schema map for this reference.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        [id: object]
    }
}
