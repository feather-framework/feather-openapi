//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension ExampleDuplicatedItem.Model {

    static var schemas: [Schema.Type] {
        [
            Schemas.Id.self,
            Schemas.Key.self,
            Schemas.KeySecond.self,
        ]
    }

    enum Schemas {

        enum Id: UUIDSchema {
            static let description = "Unique example model identifier"
        }

        enum Key: TextSchema {
            static let description = "Key of the example model"
            static let example: String? = "my-example-key"

        }

        enum KeySecond: TextSchema {
            static let id = Key.id

            static let description = "Key of the example model"
            static let example: String? = "my-example-key"
        }
    }
}
