//
//  ExampleModel+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

import FeatherOpenAPI

extension Example.Model {

    struct MainPathItem: PathItemRepresentable {
        var post: OperationRepresentable? { CreateOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { GetOperation() }
    }
}
