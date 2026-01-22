//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30

public extension JSONSchema {

    static func text(
        description: String?,
        example: AnyCodable? = nil
    ) -> Self {
        .string(
            format: .generic,
            description: description,
            example: example
        )
    }

}
