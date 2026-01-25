//
//  User+Schemas.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.User {

    struct UserIdSchema: Int64SchemaRepresentable {
        var example: Int64? { 0 }
    }

    struct UserNameSchema: StringSchemaRepresentable {
        var example: String? { "theUser" }
    }

    struct UserFirstNameSchema: StringSchemaRepresentable {
        var example: String? { "John" }
    }

    struct UserLastNameSchema: StringSchemaRepresentable {
        var example: String? { "James" }
    }

    struct UserEmailSchema: StringSchemaRepresentable {
        var example: String? { "john@email.com" }
    }

    struct UserPasswordSchema: StringSchemaRepresentable {
        var example: String? { "12345" }
    }

    struct UserPhoneSchema: StringSchemaRepresentable {
        var example: String? { "12345" }
    }

    struct UserStatusSchema: Int32SchemaRepresentable {
        var description: String? { "User Status" }
        var example: Int32? { 1 }
    }

    struct UserSchema: ObjectSchemaRepresentable {
        var propertyMap: SchemaMap {
            [
                "id": UserIdSchema(),
                "username": UserNameSchema(),
                "firstName": UserFirstNameSchema(),
                "lastName": UserLastNameSchema(),
                "email": UserEmailSchema(),
                "password": UserPasswordSchema(),
                "phone": UserPhoneSchema(),
                "userStatus": UserStatusSchema(),
            ]
        }
    }
}
