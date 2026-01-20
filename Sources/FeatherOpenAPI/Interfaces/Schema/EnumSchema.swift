//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol EnumSchema: Schema {
    static var allowedValues: [String] { get }
    static var defaultValue: String? { get }
    static var examples: [String] { get }
}

public extension EnumSchema {
    static var defaultValue: String? { nil }
    static var examples: [String] { [] }
}

public extension EnumSchema {

    static func openAPISchema() -> JSONSchema {
        var anyDefault: AnyCodable? = nil
        if let defaultValue {
            anyDefault = .init(stringLiteral: defaultValue)
        }
        return .enumeration(
            description: description,
            allowedValues: allowedValues.map { .init(stringLiteral: $0) },
            defaultValue: anyDefault,
            examples: examples.map { .init(stringLiteral: $0) }
        )
    }
}
