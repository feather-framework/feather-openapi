//
//  Identifiable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

/// Provides a default OpenAPI identifier based on the type name.
public protocol Identifiable: Sendable {
    /// The identifier to use for OpenAPI component references.
    var openAPIIdentifier: String { get }
}

extension Identifiable {

    /// Default identifier derived from the type name.
    public var openAPIIdentifier: String {
        let name = String(reflecting: type(of: self))
        var components = name.split(separator: ".")
        if components.count > 1 {
            components.remove(at: 0)  // remove namespace if present
        }
        let identifier =
            components
            .joined(separator: "")
            .replacing("()", with: "")
            .replacing("GenericComponent", with: "Generic")

        return identifier
    }
}
