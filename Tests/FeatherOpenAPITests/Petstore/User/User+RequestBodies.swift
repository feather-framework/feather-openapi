//
//  User+RequestBodies.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.User {

    struct CreateRequestBody: RequestBodyRepresentable {
        var description: String? { "Created user object" }
        var required: Bool { false }
        var contentMap: ContentMap {
            [
                .json: Content(UserSchema().reference()),
                .xml: Content(UserSchema().reference()),
                .form: Content(UserSchema().reference()),
            ]
        }
    }

    struct UpdateRequestBody: RequestBodyRepresentable {
        var description: String? { "Update an existent user in the store" }
        var required: Bool { false }
        var contentMap: ContentMap {
            [
                .json: Content(UserSchema().reference()),
                .xml: Content(UserSchema().reference()),
                .form: Content(UserSchema().reference()),
            ]
        }
    }

    struct CreateWithListRequestBody: RequestBodyRepresentable {
        var required: Bool { false }
        var contentMap: ContentMap {
            [
                .json: Content(UserArraySchema())
            ]
        }
    }

    struct UserArrayComponentRequestBody: RequestBodyRepresentable {
        var openAPIIdentifier: String { "UserArray" }
        var description: String? { "List of user object" }
        var required: Bool { false }
        var contentMap: ContentMap {
            [
                .json: Content(UserArraySchema())
            ]
        }
    }
}
