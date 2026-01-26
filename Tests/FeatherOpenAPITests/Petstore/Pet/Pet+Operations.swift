//
//  Pet+Operations.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    struct UpdateOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Update an existing pet." }
        var description: String? { "Update an existing pet by Id." }
        var operationId: String? { "updatePet" }
        var requestBody: RequestBodyRepresentable? {
            UpdateRequestBody()
        }
        var responseMap: ResponseMap {
            [
                200: PetResponse(description: "Successful operation"),
                400: EmptyResponse(description: "Invalid ID supplied"),
                404: EmptyResponse(description: "Pet not found"),
                422: EmptyResponse(description: "Validation exception"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }

    struct AddOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Add a new pet to the store." }
        var description: String? { "Add a new pet to the store." }
        var operationId: String? { "addPet" }
        var requestBody: RequestBodyRepresentable? {
            AddRequestBody()
        }
        var responseMap: ResponseMap {
            [
                200: PetResponse(description: "Successful operation"),
                400: EmptyResponse(description: "Invalid input"),
                422: EmptyResponse(description: "Validation exception"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }

    struct FindByStatusOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Finds Pets by status." }
        var description: String? {
            "Multiple status values can be provided with comma separated strings."
        }
        var operationId: String? { "findPetsByStatus" }
        var parameters: [ParameterRepresentable] {
            [
                StatusQueryParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: PetListResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid status value"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }

    struct FindByTagsOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Finds Pets by tags." }
        var description: String? {
            "Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing."
        }
        var operationId: String? { "findPetsByTags" }
        var parameters: [ParameterRepresentable] {
            [
                TagsQueryParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: PetListResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid tag value"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }

    struct GetByIdOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Find pet by ID." }
        var description: String? { "Returns a single pet." }
        var operationId: String? { "getPetById" }
        var parameters: [ParameterRepresentable] {
            [
                IdParameter()
            ]
        }
        var responseMap: ResponseMap {
            [
                200: PetResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid ID supplied"),
                404: EmptyResponse(description: "Pet not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                ApiKeySecurityRequirement(),
                PetstoreAuthSecurityRequirement(),
            ]
        }
    }

    struct UpdateWithFormOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? {
            "Updates a pet in the store with form data."
        }
        var description: String? {
            "Updates a pet resource based on the form data."
        }
        var operationId: String? { "updatePetWithForm" }
        var parameters: [ParameterRepresentable] {
            [
                UpdateIdParameter(),
                NameQueryParameter(),
                StatusUpdateQueryParameter(),
            ]
        }
        var responseMap: ResponseMap {
            [
                200: PetResponse(description: "successful operation"),
                400: EmptyResponse(description: "Invalid input"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }

    struct DeleteOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Deletes a pet." }
        var description: String? { "Delete a pet." }
        var operationId: String? { "deletePet" }
        var parameters: [ParameterRepresentable] {
            [
                ApiKeyHeaderParameter(),
                DeleteIdParameter(),
            ]
        }
        var responseMap: ResponseMap {
            [
                200: EmptyResponse(description: "Pet deleted"),
                400: EmptyResponse(description: "Invalid pet value"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }

    struct UploadImageOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [PetTag()] }
        var summary: String? { "Uploads an image." }
        var description: String? { "Upload image of the pet." }
        var operationId: String? { "uploadFile" }
        var parameters: [ParameterRepresentable] {
            [
                UploadIdParameter(),
                AdditionalMetadataQueryParameter(),
            ]
        }
        var requestBody: RequestBodyRepresentable? {
            UploadImageRequestBody()
        }
        var responseMap: ResponseMap {
            [
                200: ApiResponseJSONResponse(
                    description: "successful operation"
                ),
                400: EmptyResponse(description: "No file uploaded"),
                404: EmptyResponse(description: "Pet not found"),
                .default:
                    EmptyResponse(description: "Unexpected error"),
            ]
        }
        var security: [any SecurityRequirementRepresentable]? {
            [
                PetstoreAuthSecurityRequirement()
            ]
        }
    }
}
