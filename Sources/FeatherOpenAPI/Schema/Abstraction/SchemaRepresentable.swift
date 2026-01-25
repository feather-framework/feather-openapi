//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

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
    var deprecated: Bool? { get }
}

public extension SchemaRepresentable {
    
    func reference(
        required: Bool = true
    ) -> SchemaReference<Self> {
        .init(self)
    }
    
    var deprecated: Bool? { nil }

    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        return [:]
    }

    func allReferencedSchemaMap() -> OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        var visited = Set<SchemaID>()
        collectReferencedSchemaMap(into: &results, visited: &visited)
        return results
    }

    fileprivate func collectReferencedSchemaMap(
        into results: inout OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>,
        visited: inout Set<SchemaID>
    ) {
        for (id, schema) in referencedSchemaMap {
            guard visited.insert(id).inserted else {
                continue
            }
            results[id] = schema
            if let schema = schema as? SchemaRepresentable {
                schema.collectReferencedSchemaMap(into: &results, visited: &visited)
            }
        }
    }
}
