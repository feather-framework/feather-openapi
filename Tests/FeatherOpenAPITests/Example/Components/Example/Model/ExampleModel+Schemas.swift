//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    static var schemas: [Schema.Type] {
        [
            Schemas.Id.self,
            Schemas.Key.self,
            Schemas.Create.self,
            Schemas.Patch.self,
            Schemas.Detail.self,
            Schemas.List.self,
            Schemas.List.Item.self,
            Schemas.CustomHeader.self,
            Schemas.PatchOverride.self,
        ]
    }

    enum Schemas {

        enum Id: UUIDSchema {
            static let description = "Unique example model identifier"
        }

        enum CustomHeader: TextSchema {
            static let description = "Custom header"
            static let examples = [
                "my-example-key"
            ]
        }

        enum Key: TextSchema {
            static let description = "Key of the example model"
            static let examples = [
                "my-example-key"
            ]
        }

        enum Create: ObjectSchema {
            static let description = "example model create object"
            static var properties: [ObjectSchemaProperty] {
                [
                    .init("key", Key.self)
                ]
            }
        }

        enum Detail: ObjectSchema {
            static let description = "example model detail object"

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("id", Id.self),
                    .init("key", Key.self),
                ]
            }
        }

        enum Patch: ObjectSchema {
            static let description = "example model detail object"

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("key", Key.self, required: false)
                ]
            }
        }

        enum List: ArraySchema {

            enum Item: ObjectSchema {
                static let description = "example model detail object"

                static var properties: [ObjectSchemaProperty] {
                    [
                        .init("id", Id.self),
                        .init("key", Key.self),
                    ]
                }
            }

            static let description = "Lorem ipsum dolor sit amet"
            static var items: Schema.Type { Item.self }
        }

        enum PatchOverride: ObjectSchema {
            static let id = Patch.id
            static let override = true

            static let description = "overridden"

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("key", Key.self, required: false)
                ]
            }
        }
    }
}
