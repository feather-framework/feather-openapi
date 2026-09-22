//
//  ExampleMissingParentItemDocument.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25.

import FeatherOpenAPI
import OpenAPIKit30

struct ExampleMissingParentItemInfo: InfoRepresentable {
    var title: String { "ExampleMissingParentItem" }
    var description: String? {
        """
        Example API description
        """
    }
    var contact: any OpenAPIContactRepresentable? { ExampleContact() }
    var version: String { "1.0.0" }
}

struct ExampleMissingParentItemServer: ServerRepresentable {
    var url: any LocationRepresentable {
        ExampleLocation(location: "http://localhost:8080")
    }
    var description: String? { "dev" }
}

struct ExampleMissingParentItemItemDocument: DocumentRepresentable {
    var info: any OpenAPIInfoRepresentable { ExampleMissingParentItemInfo() }
    var servers: [any OpenAPIServerRepresentable] {
        [ExampleMissingParentItemServer()]
    }
    var paths: PathMap { [:] }
    var components: any OpenAPIComponentsRepresentable {
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
