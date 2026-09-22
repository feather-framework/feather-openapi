//
//  VariableMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

public import OpenAPIKit30

/// Ordered map of server variable names to variable definitions.
public typealias VariableMap = OrderedDictionary<
    String,
    any OpenAPIVariableRepresentable
>
