//
//  SchemaRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Describes an OpenAPI schema with common properties.
public protocol SchemaRepresentable:
    OpenAPISchemaRepresentable,
    Identifiable,
    ReferencedSchemaMapRepresentable,
    // shared properties
    RequiredProperty,
    TitleProperty,
    DescriptionProperty,
    NullableProperty
{
    /// Indicates whether the schema is deprecated.
    var deprecated: Bool? { get }
}

extension SchemaRepresentable {

    /// Creates a reference wrapper for this schema.
    /// - Parameter required: Whether the reference is required.
    /// - Returns: A schema reference.
    public func reference(
        required: Bool = true
    ) -> SchemaReference<Self> {
        .init(self)
    }

    /// Default deprecated flag is `nil`.
    public var deprecated: Bool? { nil }

    /// Referenced schemas directly used by this schema.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        [:]
    }

    /// Collects all referenced schemas transitively.
    /// - Returns: An ordered dictionary of all referenced schemas.
    public func allReferencedSchemaMap() -> OrderedDictionary<
        SchemaID, OpenAPISchemaRepresentable
    > {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        var visited = Set<SchemaID>()
        collectReferencedSchemaMap(into: &results, visited: &visited)
        return results
    }

    fileprivate func collectReferencedSchemaMap(
        into results:
            inout OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>,
        visited: inout Set<SchemaID>
    ) {
        for (id, schema) in referencedSchemaMap
        where visited.insert(id).inserted {
            results[id] = schema
            if let schema = schema as? SchemaRepresentable {
                schema.collectReferencedSchemaMap(
                    into: &results,
                    visited: &visited
                )
            }
        }
    }
}
