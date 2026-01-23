//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol PathCollectionRepresentable:
    ReferencedSchemaMapRepresentable
{
    var pathMap: PathMap { get }
    var components: Components { get }
}

extension PathCollectionRepresentable {
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        
        let schemaMaps = pathMap.values
            .map { $0.referencedSchemaMap }
            .flatMap { $0 }

        for (k, v) in schemaMaps {
            results[k] = v
        }
        return results
    }

    var components: Components {
        .init(
            schemas: referencedSchemaMap.mapValues { $0.openAPISchema() },
        )
    }
}
