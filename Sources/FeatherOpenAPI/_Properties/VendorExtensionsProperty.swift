//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol VendorExtensionsProperty {
    var vendorExtensions: [String: AnyCodable] { get }
}

public extension VendorExtensionsProperty {
    var vendorExtensions: [String: AnyCodable] { [:] }
}


