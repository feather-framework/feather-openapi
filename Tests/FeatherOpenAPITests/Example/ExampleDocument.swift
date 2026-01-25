//
//  ExampleDocument.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

import FeatherOpenAPI
import OpenAPIKit30

struct ExampleLocation: LocationRepresentable {
    let location: String
}

struct ExampleContact: ContactRepresentable {
    var name: String? { "Binary Birds" }
    var url: LocationRepresentable? {
        ExampleLocation(location: "https://binarybirds.com")
    }
    var email: String? { "info@binarybirds.com" }
}

struct ExampleInfo: InfoRepresentable {
    var title: String { "Example" }
    var description: String? {
        """
        Example API description
        """
    }
    var contact: OpenAPIContactRepresentable? { ExampleContact() }
    var version: String { "1.0.0" }
}

struct ExampleServer: ServerRepresentable {
    var url: LocationRepresentable {
        ExampleLocation(location: "http://localhost:8080")
    }
    var description: String? { "dev" }
}

struct ExamplePathCollection: PathCollectionRepresentable {
    var pathMap: PathMap {
        [
            "/example/models": Example.Model.MainPathItem(),
            "/example/models/{id}": Example.Model.IdentifiedPathItem(),
        ]
    }
}

struct ExampleDocument: DocumentRepresentable {

    let collection = ExamplePathCollection()

    var info: OpenAPIInfoRepresentable { ExampleInfo() }
    var servers: [OpenAPIServerRepresentable] { [ExampleServer()] }

    var paths: PathMap { collection.pathMap }
    var components: OpenAPIComponentsRepresentable { collection.components }
}
