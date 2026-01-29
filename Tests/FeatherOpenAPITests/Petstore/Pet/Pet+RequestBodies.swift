//
//  Pet+RequestBodies.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

extension Petstore.Pet {

    struct UpdateRequestBody: RequestBodyRepresentable {
        var description: String? { "Update an existent pet in the store" }
        var required: Bool { true }
        var contentMap: ContentMap {
            [
                .json: Content(PetSchema().reference()),
                .xml: Content(PetSchema().reference()),
                .form: Content(PetSchema().reference()),
            ]
        }
    }

    struct AddRequestBody: RequestBodyRepresentable {
        var description: String? { "Create a new pet in the store" }
        var required: Bool { true }
        var contentMap: ContentMap {
            [
                .json: Content(PetSchema().reference()),
                .xml: Content(PetSchema().reference()),
                .form: Content(PetSchema().reference()),
            ]
        }
    }

    struct UploadImageRequestBody: BinaryRequestBodyRepresentable {
        var required: Bool { false }
    }

    struct PetComponentRequestBody: RequestBodyRepresentable {
        var openAPIIdentifier: String { "Pet" }
        var description: String? {
            "Pet object that needs to be added to the store"
        }
        var required: Bool { false }
        var contentMap: ContentMap {
            [
                .json: Content(PetSchema().reference()),
                .xml: Content(PetSchema().reference()),
            ]
        }
    }
}
