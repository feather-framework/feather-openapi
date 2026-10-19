//
//  ResponseMap.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23.
//

import OpenAPIKit30

/// Ordered map of response status codes to response definitions.
public typealias ResponseMap = OrderedMap<
    ResponseStatusKey,
    any ResponseRepresentable
>

extension ResponseMap {
    var openAPIResponseMap: OpenAPI.Response.Map {
        var results: OpenAPI.Response.Map = [:]
        for (key, response) in self {
            let statusCode: OpenAPI.Response.StatusCode
            switch key {
            case .status(let value):
                statusCode = .status(code: value)
            case .default:
                statusCode = .default
            case .range(let range):
                statusCode = .range(
                    OpenAPI.Response.StatusCode.Range(rawValue: range.rawValue)!
                )
            }
            results[statusCode] = response.openAPIResponse()
        }
        return results
    }
}
