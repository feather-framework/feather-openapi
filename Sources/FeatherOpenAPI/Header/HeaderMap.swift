//
//  HeaderMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

import OpenAPIKit30

/// Ordered map of header names to header definitions.
public typealias HeaderMap = OrderedDictionary<
    String,
    HeaderRepresentable
>
