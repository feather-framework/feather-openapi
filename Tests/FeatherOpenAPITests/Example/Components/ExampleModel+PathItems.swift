//
//  ExampleModel+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25.

import FeatherOpenAPI

extension Example.Model {

    struct MainPathItem: PathItemRepresentable {
        var post: OperationRepresentable? { CreateOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { GetOperation() }
    }
}
