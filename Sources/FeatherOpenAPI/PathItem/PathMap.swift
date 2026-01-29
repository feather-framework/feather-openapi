//
//  PathMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Ordered map of OpenAPI paths to path items.
public typealias PathMap = OrderedDictionary<
    OpenAPI.Path,
    PathItemRepresentable
>
