//
//  Pet+Tags.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    struct PetTag: TagRepresentable {
        var name: String { "Pet" }
    }
}
