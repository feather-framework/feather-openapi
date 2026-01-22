//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30

public protocol ObjectSchema: Schema {
    static var properties: [ObjectSchemaProperty] { get }
}

public extension ObjectSchema {

    static func openAPISchema() -> JSONSchema {
        .object(
            description: description,
            properties: properties.reduce(into: [:]) {
                $0[$1.name] = $1.schema.reference(required: $1.required)
            }
        )
    }
}
