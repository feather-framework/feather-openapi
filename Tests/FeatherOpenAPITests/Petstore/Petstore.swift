//
//  Petstore.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

enum Petstore {}

struct PetstoreLocation: LocationRepresentable {
    let location: String
}

struct PetstoreContact: ContactRepresentable {
    var email: String? { "apiteam@swagger.io" }
}

struct PetstoreLicense: LicenseRepresentable {
    var name: String { "Apache 2.0" }
    var url: LocationRepresentable? {
        PetstoreLocation(
            location: "https://www.apache.org/licenses/LICENSE-2.0.html"
        )
    }
}

struct PetstoreInfo: InfoRepresentable {
    var title: String { "Swagger Petstore - OpenAPI 3.0" }
    var description: String? {
        """
        This is a sample Pet Store Server based on the OpenAPI 3.0 specification.  You can find out more about
        Swagger at [https://swagger.io](https://swagger.io). In the third iteration of the pet store, we've switched to the design first approach!
        You can now help us improve the API whether it's by making changes to the definition itself or to the code.
        That way, with time, we can improve the API in general, and expose some of the new features in OAS3.

        Some useful links:
        - [The Pet Store repository](https://github.com/swagger-api/swagger-petstore)
        - [The source API definition for the Pet Store](https://github.com/swagger-api/swagger-petstore/blob/master/src/main/resources/openapi.yaml)
        """
    }
    var termsOfService: LocationRepresentable? {
        PetstoreLocation(location: "https://swagger.io/terms/")
    }
    var contact: OpenAPIContactRepresentable? { PetstoreContact() }
    var license: OpenAPILicenseRepresentable? { PetstoreLicense() }
    var version: String { "1.0.27" }
}

struct PetstoreServer: ServerRepresentable {
    var url: LocationRepresentable { PetstoreLocation(location: "/api/v3") }
}

struct PetstorePathCollection: PathCollectionRepresentable {
    var pathMap: PathMap {
        [
            "pet": Petstore.Pet.MainPathItem(),
            "pet/{petId}": Petstore.Pet.IdentifiedPathItem(),
        ]
    }
}

struct PetstoreDocument: DocumentRepresentable {
    let collection = PetstorePathCollection()

    var info: OpenAPIInfoRepresentable { PetstoreInfo() }
    var servers: [OpenAPIServerRepresentable] { [PetstoreServer()] }

    var paths: PathMap { collection.pathMap }
    var components: OpenAPIComponentsRepresentable { collection.components }
}
