//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public protocol OpenAPILocationRepresentable {
    func openAPILocation() -> URL
}

extension URL: OpenAPILocationRepresentable {

    public func openAPILocation() -> URL {
        self
    }
}
