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

public protocol LocationRepresentable: OpenAPILocationRepresentable {
    var location: String { get }
}

public extension LocationRepresentable {

    func openAPILocation() -> URL {
        .init(string: location)!
    }
}

//extension String: URLRepresentable {
//    public var rawURL: String { self }
//}
    
