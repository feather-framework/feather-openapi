//
//  LocationRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// A type that can provide a URL location string.
public protocol LocationRepresentable: OpenAPILocationRepresentable {
    /// The URL string for the location.
    var location: String { get }
}

extension LocationRepresentable {

    /// Converts the location string into a `URL`.
    /// - Returns: A URL created from the location string.
    public func openAPILocation() -> URL {
        .init(string: location)!
    }
}

//extension String: URLRepresentable {
//    public var rawURL: String { self }
//}
