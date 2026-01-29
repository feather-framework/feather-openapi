//
//  SchemaMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Ordered map of schema names to schema definitions.
public typealias SchemaMap = OrderedDictionary<
    String,
    SchemaRepresentable
>
