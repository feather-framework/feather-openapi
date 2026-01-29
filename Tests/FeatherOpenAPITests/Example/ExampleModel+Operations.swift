//
//  ExampleModel+Operations.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

import FeatherOpenAPI
import OpenAPIKit30

extension Example.Model {

    struct GetOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [ModelTag()] }
        var summary: String? { "Detail example" }
        var description: String? { "Detail example detail" }
        var parameters: [ParameterRepresentable] {
            [
                IdParameter().reference(),
                CustomRequestHeaderParameter().reference(),
            ]
        }
        var responseMap: ResponseMap {
            [
                200: DetailResponse().reference()
            ]
        }
    }

    struct CreateOperation: OperationRepresentable {
        var tags: [TagRepresentable] { [ModelTag()] }
        var summary: String? { "Create example" }
        var description: String? { "Create example detail" }
        var requestBody: RequestBodyRepresentable? {
            CreateRequestBody().reference()
        }
        var responseMap: ResponseMap {
            [
                200: DetailResponse().reference()
            ]
        }
    }
}
