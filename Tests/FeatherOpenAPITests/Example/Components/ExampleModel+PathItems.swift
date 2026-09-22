//
//  ExampleModel+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25.

import FeatherOpenAPI

extension Example.Model {

    struct MainPathItem: PathItemRepresentable {
        var post: any OperationRepresentable? { CreateOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { GetOperation() }
    }
}
