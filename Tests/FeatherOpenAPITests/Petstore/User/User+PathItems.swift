//
//  User+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22.
//

import FeatherOpenAPI

extension Petstore.User {

    struct MainPathItem: PathItemRepresentable {
        var post: any OperationRepresentable? { CreateOperation() }
    }

    struct CreateWithListPathItem: PathItemRepresentable {
        var post: any OperationRepresentable? { CreateWithListOperation() }
    }

    struct LoginPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { LoginOperation() }
    }

    struct LogoutPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { LogoutOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { GetByNameOperation() }
        var put: any OperationRepresentable? { UpdateOperation() }
        var delete: any OperationRepresentable? { DeleteOperation() }
    }
}
