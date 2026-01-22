//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit30

public extension JSONSchema {

    static func enumeration(
        description: String?,
        allowedValues: [AnyCodable],
        defaultValue: AnyCodable? = nil,
        example: AnyCodable? = nil
    ) -> JSONSchema {
        .string(
            format: .generic,
            description: description,
            allowedValues: allowedValues,
            defaultValue: defaultValue,
            example: example
        )
    }
}
