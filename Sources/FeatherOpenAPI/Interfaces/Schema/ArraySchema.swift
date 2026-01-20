//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol ArraySchema: Schema {
    static var minItems: Int? { get }
    static var maxItems: Int? { get }
    static var items: Schema.Type { get }
}

public extension ArraySchema {
    static var minItems: Int? { 0 }
    static var maxItems: Int? { 1000 }
}

public extension ArraySchema {

    static func openAPISchema() -> JSONSchema {
        .array(
            description: description,
            minItems: minItems,
            maxItems: maxItems,
            items: items.reference()
        )
    }
}
