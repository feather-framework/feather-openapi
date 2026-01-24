//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

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
    var info: OpenAPIInfoRepresentable { ExampleInfo() }
    var servers: [OpenAPIServerRepresentable] { [ExampleServer()] }
    var paths: PathMap { ExamplePathCollection().pathMap }
    var components: OpenAPIComponentsRepresentable {
        let collection = ExamplePathCollection()
        let bearer = Example.Model.BearerTokenSecurityScheme()
        return Components(
            schemas: collection.referencedSchemaMap,
            parameters: collection.referencedParameterMap,
            responses: collection.referencedResponseMap,
            requestBodies: collection.referencedRequestBodyMap,
            headers: collection.referencedHeaderMap,
            securitySchemes: [bearer.reference().id: bearer]
        )
    }
    var security: [OpenAPISecurityRequirementRepresentable] {
        [
            SecurityRequirement(
                [
                    (Example.Model.BearerTokenSecurityScheme().reference(), [])
                ]
            )
        ]
    }
}
