//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30

public protocol EnumSchema: Schema {
    static var allowedValues: [String] { get }
    static var defaultValue: String? { get }
    static var example: String? { get }
}

public extension EnumSchema {
    static var defaultValue: String? { nil }
    static var example: String? { nil }
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
            example: example.map { .init(stringLiteral: $0) }
        )
    }
}
