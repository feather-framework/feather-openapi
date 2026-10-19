//
//  PathMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

/// Ordered map of OpenAPI paths to path items.
public typealias PathMap = OrderedMap<
    String,
    any PathItemRepresentable
>
