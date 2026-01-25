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
}
