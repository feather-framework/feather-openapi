//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension ExampleMissingParentItem.Model {

    static let schemas: [Schema.Type] = [
        Schemas.Id.self,
        Schemas.Key.self,
    ]

    enum Schemas {

        enum Id: UUIDSchema {
            static let description = "Unique example model identifier"
        }

        enum Key: TextSchema {
            static let override = true
            static let description = "Key of the example model"
            static let examples = [
                "my-example-key"
            ]
        }

    }
}
