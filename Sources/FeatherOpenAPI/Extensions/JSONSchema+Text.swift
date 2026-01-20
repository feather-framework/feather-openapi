//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public extension JSONSchema {

    static func text(
        description: String,
        examples: [AnyCodable] = []
    ) -> Self {
        .string(
            format: .generic,
            description: description,
            examples: examples
        )
    }

}
