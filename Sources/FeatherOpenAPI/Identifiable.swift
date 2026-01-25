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
        let name = String(reflecting: type(of: self))
        var components = name.split(separator: ".")
        if components.count > 1 {
            components.remove(at: 0)  // remove namespace if present
        }
        let identifier = components
            .joined(separator: "")
            .replacing("()", with: "")
            .replacing("GenericComponent", with: "Generic")

        return identifier
    }
}





