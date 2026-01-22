//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30
import Foundation

public protocol UUIDSchema: Schema {
    static var example: UUID? { get }
}

public extension UUIDSchema {

    static var example: UUID? {
        .init(uuidString: "F257448D-73F6-4D6F-BB8A-8D756A622F70")!
    }

    static func openAPISchema() -> JSONSchema {
        .string(
            format: .generic,
            description: description,
            example: example.map { .init($0.uuidString) }
        )
    }
}
