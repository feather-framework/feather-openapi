//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

public protocol Identifiable: Sendable {
    var openAPIIdentifier: String { get }
}

public extension Identifiable {

    var openAPIIdentifier: String {
        String(describing: type(of: self))
    }
}
