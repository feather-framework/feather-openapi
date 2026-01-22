//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30

public protocol TextSchema: Schema {
    static var example: String? { get }
}

public extension TextSchema {
    static var example: String? { nil }
}

public extension TextSchema {

    static func openAPISchema() -> JSONSchema {
        .text(
            description: description,
            example: example.map { .init(stringLiteral: $0) }
        )
    }
}
