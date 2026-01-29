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

struct PetstoreExternalDocs: ExternalDocsRepresentable {
    var description: String? { "Find out more about Swagger" }
    var url: LocationRepresentable {
        PetstoreLocation(location: "https://swagger.io")
    }
}

struct PetstorePathCollection: PathCollectionRepresentable {
    var pathMap: PathMap {
        [
            "/pet": Petstore.Pet.MainPathItem(),
            "/pet/findByStatus": Petstore.Pet.FindByStatusPathItem(),
            "/pet/findByTags": Petstore.Pet.FindByTagsPathItem(),
            "/pet/{petId}": Petstore.Pet.IdentifiedPathItem(),
            "/pet/{petId}/uploadImage": Petstore.Pet.UploadImagePathItem(),
            "/store/inventory": Petstore.Store.InventoryPathItem(),
            "/store/order": Petstore.Store.OrderPathItem(),
            "/store/order/{orderId}": Petstore.Store.OrderIdentifiedPathItem(),
            "/user": Petstore.User.MainPathItem(),
            "/user/createWithList": Petstore.User.CreateWithListPathItem(),
            "/user/login": Petstore.User.LoginPathItem(),
            "/user/logout": Petstore.User.LogoutPathItem(),
            "/user/{username}": Petstore.User.IdentifiedPathItem(),
        ]
    }
}

struct PetstoreComponents: ComponentsRepresentable {
    let base: FeatherOpenAPI.Components

    var schemas: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        base.schemas
    }

    var parameters:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    {
        base.parameters
    }

    var examples: OrderedDictionary<ExampleID, OpenAPIExampleRepresentable> {
        base.examples
    }

    var responses: OrderedDictionary<ResponseID, OpenAPIResponseRepresentable> {
        base.responses
    }

    var requestBodies:
        OrderedDictionary<
            RequestBodyID, OpenAPIRequestBodyRepresentable
        >
    {
        var results = base.requestBodies

        let petRequestBody = Petstore.Pet.PetComponentRequestBody()
        results[.init(petRequestBody.openAPIIdentifier)] = petRequestBody

        let userArrayRequestBody =
            Petstore.User.UserArrayComponentRequestBody()
        results[.init(userArrayRequestBody.openAPIIdentifier)] =
            userArrayRequestBody

        return results
    }

    var headers: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> {
        base.headers
    }

    var securityRequirements: [SecurityRequirementRepresentable] {
        base.securityRequirements
    }

    var links: OrderedDictionary<LinkID, OpenAPILinkRepresentable> {
        base.links
    }
}

struct PetstoreDocument: DocumentRepresentable {
    let collection = PetstorePathCollection()

    var info: OpenAPIInfoRepresentable { PetstoreInfo() }
    var servers: [OpenAPIServerRepresentable] { [PetstoreServer()] }

    var externalDocs: ExternalDocsRepresentable? { PetstoreExternalDocs() }

    var paths: PathMap { collection.pathMap }
    var components: OpenAPIComponentsRepresentable {
        PetstoreComponents(base: collection.components)
    }

    var referencedTags: [OpenAPITagRepresentable] {
        [
            Petstore.Pet.PetTag(),
            Petstore.Store.StoreTag(),
            Petstore.User.UserTag(),
        ]
    }

    var referencedSecurityRequirements: [SecurityRequirementRepresentable] {
        []
    }
}
