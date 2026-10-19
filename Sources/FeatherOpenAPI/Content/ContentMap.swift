//
//  ContentMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

import OpenAPIKit30

/// Ordered map of content types to content definitions.
public typealias ContentMap = OrderedMap<
    ContentTypeKey,
    any ContentRepresentable
>

extension OrderedMap
where Key == ContentTypeKey, Value == any ContentRepresentable {
    var openAPIContentMap:
        OrderedDictionary<
            OpenAPI.ContentType,
            OpenAPI.Content
        >
    {
        var results: OrderedDictionary<OpenAPI.ContentType, OpenAPI.Content> =
            [:]
        for (key, content) in self {
            results[OpenAPI.ContentType(rawValue: key.rawValue)!] =
                content.openAPIContent()
        }
        return results
    }
}
