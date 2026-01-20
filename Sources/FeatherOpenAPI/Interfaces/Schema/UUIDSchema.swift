//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit
import Foundation

public protocol UUIDSchema: Schema {
    static var examples: [UUID] { get }
}

public extension UUIDSchema {

    static var examples: [UUID] {
        [
            .init(uuidString: "F257448D-73F6-4D6F-BB8A-8D756A622F70")!,
            .init(uuidString: "84FB7C06-838A-4712-9E2A-C76294670C04")!,
            .init(uuidString: "BA4D8D41-BF9F-4122-8546-AB82A98BE28F")!,
            .init(uuidString: "519749BB-1210-4479-9B9E-292FC76444C7")!,
            .init(uuidString: "E0A42968-28EE-4D1F-BE18-13D526458686")!,
        ]
    }

    static func openAPISchema() -> JSONSchema {
        .string(
            format: .uuid,
            description: description,
            examples: examples.map { .init($0.uuidString) }
        )
    }
}
