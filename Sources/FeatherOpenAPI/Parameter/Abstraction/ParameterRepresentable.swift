//
//  ParameterRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI parameter with defaults.
public protocol ParameterRepresentable:
    OpenAPIParameterRepresentable,
    Identifiable,
    // property
    DescriptionProperty,
    DeprecatedProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable
{
    /// The parameter name.
    var name: String { get }
    /// The parameter context (path, query, header, cookie).
    var context: OpenAPI.Parameter.Context { get }
    /// The schema describing the parameter value.
    var schema: OpenAPISchemaRepresentable { get }

}

extension ParameterRepresentable {

    /// Creates a reference wrapper for this parameter.
    /// - Returns: A parameter reference.
    public func reference() -> ParameterReference<Self> {
        .init(self)
    }

    /// Builds an OpenAPI parameter object or reference.
    /// - Returns: The OpenAPI parameter representation.
    public func openAPIParameter() -> Either<
        JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter
    > {
        .init(
            .init(
                name: name,
                context: context,
                schema: schema.openAPISchema(),
                description: description,
                deprecated: deprecated,
                vendorExtensions: vendorExtensions
            )
        )
    }

    /// Referenced schemas used by the parameter.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        guard let schema = schema as? SchemaRepresentable else {
            return [:]
        }
        return schema.allReferencedSchemaMap()
    }
}
