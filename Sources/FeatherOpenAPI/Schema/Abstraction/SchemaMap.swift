//
//  SchemaMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

public import OpenAPIKit30

/// Ordered map of schema names to schema definitions.
public typealias SchemaMap = OrderedDictionary<
    String,
    any SchemaRepresentable
>
