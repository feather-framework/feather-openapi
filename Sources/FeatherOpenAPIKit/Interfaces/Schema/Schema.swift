//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit30

public protocol OpenAPISchema: Identifiable {
    static func openAPISchema() -> JSONSchema
}

public extension OpenAPISchema {

    static func reference(required: Bool = true) -> JSONSchema {
        .reference(.component(named: id), required: required)
    }

    static func reference() -> OpenAPI.Content {
        .init(schemaReference: .component(named: id))
    }
}

public protocol Schema: OpenAPISchema {
    static var description: String? { get }
}

extension Schema {

    public static var description: String? { nil }
}
