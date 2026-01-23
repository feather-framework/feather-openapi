//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

public protocol RequestBodyRepresentable:
    Identifiable,
    OpenAPIRequestBodyRepresentable,
    DescriptionProperty,
    RequiredProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable
{
    var contentMap: ContentMap { get }
}

public extension RequestBodyRepresentable {

    func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: description,
            content: contentMap.mapValues { $0.openAPIContent() },
            required: `required`,
            vendorExtensions: vendorExtensions
        )
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        for content in contentMap.values {
            if let ref = content.schema as? SchemaReferenceRepresentable {
                results[ref.id] = ref.object
            }
        }
        return results
    }
}
