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
        var example: Int64? { 10 }
        var required: Bool { false }
    }

    struct UserNameSchema: StringSchemaRepresentable {
        var example: String? { "theUser" }
        var required: Bool { false }
    }

    struct UserFirstNameSchema: StringSchemaRepresentable {
        var example: String? { "John" }
        var required: Bool { false }
    }

    struct UserLastNameSchema: StringSchemaRepresentable {
        var example: String? { "James" }
        var required: Bool { false }
    }

    struct UserEmailSchema: StringSchemaRepresentable {
        var example: String? { "john@email.com" }
        var required: Bool { false }
    }

    struct UserPasswordSchema: StringSchemaRepresentable {
        var example: String? { "12345" }
        var required: Bool { false }
    }

    struct UserPhoneSchema: StringSchemaRepresentable {
        var example: String? { "12345" }
        var required: Bool { false }
    }

    struct UserStatusSchema: Int32SchemaRepresentable {
        var description: String? { "User Status" }
        var example: Int32? { 1 }
        var required: Bool { false }
    }

    struct UserSchema: ObjectSchemaRepresentable {
        var openAPIIdentifier: String { "User" }
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

    struct UsernameSchema: StringSchemaRepresentable {
    }

    struct LoginUsernameSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct LoginPasswordSchema: StringSchemaRepresentable {
        var required: Bool { false }
    }

    struct UserArraySchema: ArraySchemaRepresentable {
        var items: SchemaRepresentable? { UserSchema().reference() }
    }
}
