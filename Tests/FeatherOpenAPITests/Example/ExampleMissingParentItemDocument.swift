//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI
import OpenAPIKit30

struct ExampleMissingParentItemInfo: InfoRepresentable {
    var title: String { "ExampleMissingParentItem" }
    var description: String? {
        """
        Example API description
        """
    }
    var contact: OpenAPIContactRepresentable? { ExampleContact() }
    var version: String { "1.0.0" }
}

struct ExampleMissingParentItemServer: ServerRepresentable {
    var url: LocationRepresentable {
        ExampleLocation(location: "http://localhost:8080")
    }
    var description: String? { "dev" }
}

struct ExampleMissingParentItemItemDocument: DocumentRepresentable {
    var info: OpenAPIInfoRepresentable { ExampleMissingParentItemInfo() }
    var servers: [OpenAPIServerRepresentable] { [ExampleMissingParentItemServer()] }
    var paths: PathMap { [:] }
    var components: OpenAPIComponentsRepresentable {
        let idSchema = ExampleMissingParentItem.Model.IdSchema()
        let keySchema = ExampleMissingParentItem.Model.KeySchema()
        return Components(
            schemas: [
                SchemaID(idSchema.openAPIIdentifier): idSchema,
                SchemaID(keySchema.openAPIIdentifier): keySchema,
            ]
        )
    }
}
