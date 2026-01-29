//
//  User+Responses.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.User {

    struct UserResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap {
            [
                .json: Content(UserSchema().reference()),
                .xml: Content(UserSchema().reference()),
            ]
        }
    }

    struct LoginResponse: ResponseRepresentable {
        var description: String { "successful operation" }
        var headerMap: HeaderMap {
            [
                "X-Rate-Limit": RateLimitHeader(),
                "X-Expires-After": ExpiresAfterHeader(),
            ]
        }
        var contentMap: ContentMap {
            [
                .xml: Content(LoginResponseSchema()),
                .json: Content(LoginResponseSchema()),
            ]
        }
    }

    struct LoginResponseSchema: StringSchemaRepresentable {
    }

    struct EmptyResponse: ResponseRepresentable {
        let description: String
        var contentMap: ContentMap { [:] }
    }
}
