//
//  User+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.User {

    struct MainPathItem: PathItemRepresentable {
        var post: OperationRepresentable? { CreateOperation() }
    }

    struct CreateWithListPathItem: PathItemRepresentable {
        var post: OperationRepresentable? { CreateWithListOperation() }
    }

    struct LoginPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { LoginOperation() }
    }

    struct LogoutPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { LogoutOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { GetByNameOperation() }
        var put: OperationRepresentable? { UpdateOperation() }
        var delete: OperationRepresentable? { DeleteOperation() }
    }
}
