//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public protocol URLRepresentable {
    func url() -> URL
}

public struct Location: URLRepresentable {

    public var string: String

    public init(
        _ string: String
    ) {
        self.string = string
    }

    public func url() -> URL {
        .init(string: string)!
    }
}
