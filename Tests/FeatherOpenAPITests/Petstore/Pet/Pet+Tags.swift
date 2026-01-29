//
//  Pet+Tags.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    struct PetTag: TagRepresentable {
        var name: String { "pet" }
        var description: String? { "Everything about your Pets" }
        var externalDocs: ExternalDocsRepresentable? {
            PetTagExternalDocs()
        }
    }

    struct PetTagExternalDocs: ExternalDocsRepresentable {
        var description: String? { "Find out more" }
        var url: LocationRepresentable {
            PetstoreLocation(location: "https://swagger.io")
        }
    }
}
