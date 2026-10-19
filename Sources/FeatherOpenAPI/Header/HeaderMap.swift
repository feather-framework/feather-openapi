//
//  HeaderMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

/// Ordered map of header names to header definitions.
public typealias HeaderMap = OrderedMap<
    String,
    any HeaderRepresentable
>
