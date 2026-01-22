//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.User {

    enum Schemas {

        enum User: ObjectSchema {

            enum Id: Int64Schema {
                static var example: Int? { 0 }
            }

            enum UserName: TextSchema {
                static var example: String? { "theUser" }
            }

            enum FirstName: TextSchema {
                static var example: String? { "John" }
            }

            enum LastName: TextSchema {
                static var example: String? { "James" }
            }

            enum Email: EmailSchema {
                static var example: String? { "john@email.com" }
            }

            enum Password: PasswordSchema {
                static var example: String? { "12345" }
            }

            enum Phone: TextSchema {
                static var example: String? { "12345" }
            }

            enum UserStatus: Int32Schema {
                static var description: String? { "User Status" }
                static var example: Int? { 1 }
            }

            static var properties: [ObjectSchemaProperty] {
                [
                    .init("id", Id.self),
                    .init("username", UserName.self),
                    .init("firstName", FirstName.self),
                    .init("lastName", LastName.self),
                    .init("email", Email.self),
                    .init("password", Password.self),
                    .init("phone", Phone.self),
                    .init("userStatus", UserStatus.self),
                ]
            }
        }
    }
}
