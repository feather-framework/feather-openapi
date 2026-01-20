//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit

public extension JSONSchema {

    static func enumeration(
        description: String,
        allowedValues: [AnyCodable],
        defaultValue: AnyCodable? = nil,
        examples: [AnyCodable] = []
    ) -> JSONSchema {
        .string(
            format: .generic,
            description: description,
            allowedValues: allowedValues,
            defaultValue: defaultValue,
            examples: examples
        )
    }
}
