//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public struct ObjectSchemaProperty {

    public let name: String
    public let schema: Schema.Type
    public let required: Bool

    public init(
        _ name: String,
        _ schema: Schema.Type,
        required: Bool = true
    ) {
        self.name = name
        self.schema = schema
        self.required = required
    }
}
