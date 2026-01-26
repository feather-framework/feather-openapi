//
//  Store+Tags.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Store {

    struct StoreTag: TagRepresentable {
        var name: String { "store" }
        var description: String? { "Access to Petstore orders" }
        var externalDocs: ExternalDocsRepresentable? {
            StoreTagExternalDocs()
        }
    }

    struct StoreTagExternalDocs: ExternalDocsRepresentable {
        var description: String? { "Find out more about our store" }
        var url: LocationRepresentable {
            PetstoreLocation(location: "https://swagger.io")
        }
    }
}
