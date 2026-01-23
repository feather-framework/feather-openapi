//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol ResponseRepresentable:
    OpenAPIResponseRepresentable,
    VendorExtensionsProperty
{
    var description: String { get }
    var headerMap: HeaderMap { get }
    var contentMap: ContentMap { get }
}

public extension ResponseRepresentable {

    var headerMap: HeaderMap { [:] }

    func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: description,
            headers: headerMap.mapValues { $0.openAPIHeader() },
            content: contentMap.mapValues { $0.openAPIContent() },
            links: [:],
            vendorExtensions: vendorExtensions
        )
    }
}
