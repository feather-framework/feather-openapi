//
//  ResponseRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

/// Describes an OpenAPI response with defaults.
public protocol ResponseRepresentable:
    OpenAPIResponseRepresentable,
    Identifiable,
    VendorExtensionsProperty
{
    /// Response description.
    var description: String { get }
    /// Map of response headers.
    var headerMap: HeaderMap { get }
    /// Map of response content by content type.
    var contentMap: ContentMap { get }
}

extension ResponseRepresentable {

    /// Default header map is empty.
    public var headerMap: HeaderMap { [:] }

    /// Creates a reference wrapper for this response.
    /// - Returns: A response reference.
    public func reference() -> ResponseReference<Self> {
        .init(self)
    }

    /// Builds an OpenAPI response object or reference.
    /// - Returns: The OpenAPI response representation.
    public func openAPIResponse() -> Either<
        JSONReference<OpenAPI.Response>, OpenAPI.Response
    > {
        .init(
            .init(
                description: description,
                headers: headerMap.mapValues { $0.openAPIHeader() },
                content: contentMap.mapValues { $0.openAPIContent() },
                links: [:],
                vendorExtensions: vendorExtensions
            )
        )
    }
}
