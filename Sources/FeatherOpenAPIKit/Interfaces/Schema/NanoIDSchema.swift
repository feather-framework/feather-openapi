//
//  File.swift
//
//
//  Created by Tibor Bodecs on 16/03/2024.
//

import OpenAPIKit30

public protocol NanoIDSchema: Schema {
    static var example: String? { get }
}

public extension NanoIDSchema {

    static var example: String? {
        "xHVX15b8z_wQDPH93uVp5"
    }

    static func openAPISchema() -> JSONSchema {
        .string(
            format: .generic,
            description: description,
            example: example.map { .init($0) }
        )
    }
}
