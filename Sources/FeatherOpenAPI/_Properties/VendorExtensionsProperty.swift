//
//  VendorExtensionsProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Provides vendor extension storage.
public protocol VendorExtensionsProperty {
    /// Vendor extension values keyed by extension name.
    var vendorExtensions: [String: AnyCodable] { get }
}

extension VendorExtensionsProperty {
    /// Default vendor extensions are empty.
    public var vendorExtensions: [String: AnyCodable] { [:] }
}
