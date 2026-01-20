//
//  File.swift
//
//
//  Created by Tibor Bodecs on 16/03/2024.
//

import OpenAPIKit

public protocol NanoIDSchema: Schema {
    static var examples: [String] { get }
}

public extension NanoIDSchema {

    static var examples: [String] {
        [
            "xHVX15b8z_wQDPH93uVp5",
            "n4a9MyIfbqED76LPz4EaL",
            "9eo5rQfE4I8ldgk5JLvZW",
            "ZtmPFlB6FFU16suLM-LVf",
            "mGUz4JpOVWYwpN2pwjYk9",
        ]
    }

    static func openAPISchema() -> JSONSchema {
        .string(
            format: .generic,
            description: description,
            examples: examples.map { .init($0) }
        )
    }
}
