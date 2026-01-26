//
//  Pet+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    struct MainPathItem: PathItemRepresentable {
        var put: OperationRepresentable? { UpdateOperation() }
        var post: OperationRepresentable? { AddOperation() }
    }

    struct FindByStatusPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { FindByStatusOperation() }
    }

    struct FindByTagsPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { FindByTagsOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: OperationRepresentable? { GetByIdOperation() }
        var post: OperationRepresentable? { UpdateWithFormOperation() }
        var delete: OperationRepresentable? { DeleteOperation() }
    }

    struct UploadImagePathItem: PathItemRepresentable {
        var post: OperationRepresentable? { UploadImageOperation() }
    }
}
