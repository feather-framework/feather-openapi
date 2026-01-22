//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit30

public protocol Identifiable {
    static var id: String { get }
    static var override: Bool { get }
}

public extension Identifiable {

    static var id: String {
        var components = String(reflecting: self).split(separator: ".")
        components.remove(at: 0)  // remove namespace
        components.remove(at: 2)  // remove enum name
        return
            components
            .joined(separator: "")
            .replacing("GenericComponent", with: "Generic")
    }

    static var override: Bool { false }
}

public extension Identifiable {
    static var componentKey: OpenAPI.ComponentKey { .init(stringLiteral: id) }
}
