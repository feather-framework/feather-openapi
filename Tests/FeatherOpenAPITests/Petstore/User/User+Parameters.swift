//
//  User+Parameters.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.User {

    struct LoginUsernameParameter: QueryParameterRepresentable {
        var name: String { "username" }
        var description: String? { "The user name for login" }
        var required: Bool { false }
        var schema: any OpenAPISchemaRepresentable {
            LoginUsernameSchema()
        }
    }

    struct LoginPasswordParameter: QueryParameterRepresentable {
        var name: String { "password" }
        var description: String? { "The password for login in clear text" }
        var required: Bool { false }
        var schema: any OpenAPISchemaRepresentable {
            LoginPasswordSchema()
        }
    }

    struct UsernameParameter: PathParameterRepresentable {
        var name: String { "username" }
        var description: String? {
            "The name that needs to be fetched. Use user1 for testing"
        }
        var schema: any OpenAPISchemaRepresentable {
            UsernameSchema()
        }
    }

    struct UpdateUsernameParameter: PathParameterRepresentable {
        var name: String { "username" }
        var description: String? { "name that need to be deleted" }
        var schema: any OpenAPISchemaRepresentable {
            UsernameSchema()
        }
    }

    struct DeleteUsernameParameter: PathParameterRepresentable {
        var name: String { "username" }
        var description: String? { "The name that needs to be deleted" }
        var schema: any OpenAPISchemaRepresentable {
            UsernameSchema()
        }
    }
}
