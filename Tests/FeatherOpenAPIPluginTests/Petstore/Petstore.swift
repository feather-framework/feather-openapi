//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30
import Foundation

enum Petstore {}

// https://petstore3.swagger.io/
// https://petstore3.swagger.io/api/v3/openapi.json
// https://petstore3.swagger.io/api/v3/openapi.yaml

struct PetstoreDocument: Document {

    let components: [Component.Type]

    init() {
        self.components = [
            Petstore.User.self,
            Petstore.Store.self,
            Petstore.Pet.self,
            Petstore.ApiResponse.self,
            Petstore.Category.self,
            Petstore.Tag.self,
        ]
    }

    func openAPIDocument() throws -> OpenAPI.Document {
        try composedDocument(
            info: .init(
                title: "Swagger Petstore - OpenAPI 3.0",
                description: """
                    This is a sample Pet Store Server based on the OpenAPI 3.0 specification.  You can find out more about\nSwagger at [https://swagger.io](https://swagger.io). In the third iteration of the pet store, we've switched to the design first approach!\nYou can now help us improve the API whether it's by making changes to the definition itself or to the code.\nThat way, with time, we can improve the API in general, and expose some of the new features in OAS3.\n\nSome useful links:\n- [The Pet Store repository](https://github.com/swagger-api/swagger-petstore)\n- [The source API definition for the Pet Store](https://github.com/swagger-api/swagger-petstore/blob/master/src/main/resources/openapi.yaml)
                    """,
                termsOfService: .init(string: "https://swagger.io/terms/")!,
                contact: .init(
                    email: "apiteam@swagger.io"
                ),
                license: .init(
                    name: "Apache 2.0",
                    url: .init(
                        string:
                            "https://www.apache.org/licenses/LICENSE-2.0.html"
                    )!
                ),
                version: "1.0.27",
            ),
            // TODO: external docs support.
            servers: [
                .init(
                    url: .init(string: "/api/v3")!
                )
            ],
        )
    }
}
