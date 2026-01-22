//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI
import OpenAPIKit30

func petstore(
    using builder: inout ComponentBuilder
) {

    let apiResponseID = builder.schema(id: "ApiResponse") {
        JSONSchema.object(
            properties: [
                "code": .integer(format: .int32),
                "type": .string,
                "message": .string,
            ],
        )
    }

    let tagID = builder.schema(id: "Tag") {
        JSONSchema.object(
            properties: [
                "id": .integer(format: .int64),
                "name": .string,
            ],
        )
    }

    let categoryID = builder.schema(id: "Category") {
        JSONSchema.object(
            properties: [
                "code": .integer(format: .int32),
                "type": .string,
                "message": .string,
            ],
        )
    }

    let petID = builder.schema(id: "Pet") {
        JSONSchema.object(
            properties: [
                "id": .integer(format: .int64, example: 10),
                "name": .string(example: "doggie"),
                "category": .reference(
                    .component(named: categoryID.rawValue),
                    required: true
                ),
            ],
        )
    }
}
