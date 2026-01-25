//
//  OpenAPILocationRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// A type that can produce a URL location.
public protocol OpenAPILocationRepresentable {
    /// Returns the URL representation.
    /// - Returns: The URL.
    func openAPILocation() -> URL
}

extension URL: OpenAPILocationRepresentable {

    /// Returns `self` as a URL location.
    /// - Returns: The current URL.
    public func openAPILocation() -> URL {
        self
    }
}
