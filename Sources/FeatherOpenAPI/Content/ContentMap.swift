//
//  ContentMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

import OpenAPIKit30

/// Ordered map of content types to content definitions.
public typealias ContentMap = OrderedDictionary<
    OpenAPI.ContentType,
    ContentRepresentable
>
