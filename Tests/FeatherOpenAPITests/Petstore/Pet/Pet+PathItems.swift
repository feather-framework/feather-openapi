//
//  Pet+PathItems.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22.
//

import FeatherOpenAPI

extension Petstore.Pet {

    struct MainPathItem: PathItemRepresentable {
        var put: any OperationRepresentable? { UpdateOperation() }
        var post: any OperationRepresentable? { AddOperation() }
    }

    struct FindByStatusPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { FindByStatusOperation() }
    }

    struct FindByTagsPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { FindByTagsOperation() }
    }

    struct IdentifiedPathItem: PathItemRepresentable {
        var get: any OperationRepresentable? { GetByIdOperation() }
        var post: any OperationRepresentable? { UpdateWithFormOperation() }
        var delete: any OperationRepresentable? { DeleteOperation() }
    }

    struct UploadImagePathItem: PathItemRepresentable {
        var post: any OperationRepresentable? { UploadImageOperation() }
    }
}
