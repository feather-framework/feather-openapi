//
//  ResponseMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

public import OpenAPIKit30

/// Ordered map of response status codes to response definitions.
public typealias ResponseMap = OrderedDictionary<
    OpenAPI.Response.StatusCode,
    any ResponseRepresentable
>
