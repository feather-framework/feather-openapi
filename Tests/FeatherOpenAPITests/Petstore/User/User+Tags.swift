//
//  User+Tags.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.User {

    struct UserTag: TagRepresentable {
        var name: String { "user" }
        var description: String? { "Operations about user" }
    }
}
