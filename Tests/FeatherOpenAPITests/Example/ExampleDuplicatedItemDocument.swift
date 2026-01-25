//
//  ExampleDuplicatedItemDocument.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI
import OpenAPIKit30

struct ExampleDuplicatedItemInfo: InfoRepresentable {
    var title: String { "ExampleDuplicatedItem" }
    var description: String? {
        """
        Example API description
        """
    }
    var contact: OpenAPIContactRepresentable? { ExampleContact() }
    var version: String { "1.0.0" }
}

struct ExampleDuplicatedItemServer: ServerRepresentable {
    var url: LocationRepresentable {
        ExampleLocation(location: "http://localhost:8080")
    }
    var description: String? { "dev" }
}

struct ExampleDuplicatedItemDocument: DocumentRepresentable {
    var info: OpenAPIInfoRepresentable { ExampleDuplicatedItemInfo() }
    var servers: [OpenAPIServerRepresentable] {
        [ExampleDuplicatedItemServer()]
    }
    var paths: PathMap { [:] }
    var components: OpenAPIComponentsRepresentable {
        let idSchema = ExampleDuplicatedItem.Model.IdSchema()
        let keySchema = ExampleDuplicatedItem.Model.KeySchema()
        let keySecondSchema = ExampleDuplicatedItem.Model.KeySecondSchema()
        return Components(
            schemas: [
                SchemaID(idSchema.openAPIIdentifier): idSchema,
                SchemaID(keySchema.openAPIIdentifier): keySchema,
                SchemaID(keySecondSchema.openAPIIdentifier): keySecondSchema,
            ]
        )
    }
}
