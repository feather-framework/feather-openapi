//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI
import OpenAPIKit30

extension Example.Model {

    struct IdSchema: StringSchemaRepresentable {
        var description: String? { "Unique example model identifier" }
    }

    struct CustomHeaderSchema: StringSchemaRepresentable {
        var description: String? { "Custom header" }
        var example: String? { "my-example-key" }
    }

    struct KeySchema: StringSchemaRepresentable {
        var description: String? { "Key of the example model" }
        var example: String? { "my-example-key" }
    }

    struct CreateSchema: ObjectSchemaRepresentable {
        var description: String? { "example model create object" }
        var propertyMap: SchemaMap {
            [
                "key": KeySchema().reference()
            ]
        }
    }

    struct DetailSchema: ObjectSchemaRepresentable {
        var description: String? { "example model detail object" }
        var propertyMap: SchemaMap {
            [
                "id": IdSchema().reference(),
                "key": KeySchema().reference(),
            ]
        }
    }

    struct PatchSchema: ObjectSchemaRepresentable {
        var description: String? { "example model detail object" }
        var propertyMap: SchemaMap {
            [
                "key": KeySchema().reference(required: false)
            ]
        }
    }

    struct ListItemSchema: ObjectSchemaRepresentable {
        var description: String? { "example model detail object" }
        var propertyMap: SchemaMap {
            [
                "id": IdSchema().reference(),
                "key": KeySchema().reference(),
            ]
        }
    }

    struct ListSchema: ArraySchemaRepresentable {
        var description: String? { "Lorem ipsum dolor sit amet" }
        var items: JSONSchema? { ListItemSchema().openAPISchema() }
    }

    struct PatchOverrideSchema: ObjectSchemaRepresentable {
        var description: String? { "overridden" }
        var propertyMap: SchemaMap {
            [
                "key": KeySchema().reference(required: false)
            ]
        }
    }
}
