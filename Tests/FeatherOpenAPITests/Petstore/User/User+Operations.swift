//
//  User+Operations.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.User {

    struct CreateOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Create user." }
        var description: String? {
            "This can only be done by the logged in user."
        }
        var operationId: String? { "createUser" }
        var requestBody: RequestBodyRepresentable? { CreateRequestBody() }
        var responseMap: ResponseMap {
            [
                200: UserResponse(description: "successful operation"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct CreateWithListOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Creates list of users with given input array." }
        var description: String? {
            "Creates list of users with given input array."
        }
        var operationId: String? { "createUsersWithListInput" }
        var requestBody: RequestBodyRepresentable? {
            CreateWithListRequestBody()
        }
        var responseMap: ResponseMap {
            [
                200: UserResponse(description: "Successful operation"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct LoginOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Logs user into the system." }
        var description: String? { "Log into the system." }
        var operationId: String? { "loginUser" }
        var parameters: [ParameterRepresentable] {
            [
                LoginUsernameParameter(),
                LoginPasswordParameter(),
            ]
        }
        var responseMap: ResponseMap {
            [
                200: LoginResponse(),
                400: EmptyResponse(
                    description: "Invalid username/password supplied"
                ),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct LogoutOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Logs out current logged in user session." }
        var description: String? { "Log user out of the system." }
        var operationId: String? { "logoutUser" }
        var responseMap: ResponseMap {
            [
                200: EmptyResponse(description: "successful operation"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct GetByNameOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Get user by user name." }
        var description: String? { "Get user detail based on username." }
        var operationId: String? { "getUserByName" }
        var parameters: [ParameterRepresentable] {
            [
                UsernameParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: UserResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid username supplied"),
                404: EmptyResponse(description: "User not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct UpdateOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Update user resource." }
        var description: String? {
            "This can only be done by the logged in user."
        }
        var operationId: String? { "updateUser" }
        var parameters: [ParameterRepresentable] {
            [
                UpdateUsernameParameter()
            ]
        }
        var requestBody: RequestBodyRepresentable? { UpdateRequestBody() }
        var responseMap: ResponseMap {
            [
                200: EmptyResponse(description: "successful operation"),
                400: EmptyResponse(description: "bad request"),
                404: EmptyResponse(description: "user not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }

    struct DeleteOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [UserTag()] }
        var summary: String? { "Delete user resource." }
        var description: String? {
            "This can only be done by the logged in user."
        }
        var operationId: String? { "deleteUser" }
        var parameters: [ParameterRepresentable] {
            [
                DeleteUsernameParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: EmptyResponse(description: "User deleted"),
                400: EmptyResponse(description: "Invalid username supplied"),
                404: EmptyResponse(description: "User not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
    }
}
