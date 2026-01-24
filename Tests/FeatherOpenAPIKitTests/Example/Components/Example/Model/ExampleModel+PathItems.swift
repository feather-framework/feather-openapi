//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    struct MainPathItem: PathItemRepresentable {
        var post: OperationRepresentable? { CreateOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { GetOperation() }
    }
}
