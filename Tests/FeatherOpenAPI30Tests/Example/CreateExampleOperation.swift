//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30

func createExample(
    using builder: inout ComponentBuilder
) -> Operation {

    let testSchemaID = builder.schema(id: "TestSchema") {
        StringSchema()
    }

    let headerID = builder.header(id: "header") {
        Header(schema: testSchemaID)
    }

    let p1 = builder.parameter(id: "foo") {
        .init(name: "foo", context: .path, schema: .string)
    }

    let requestBodyID = builder.requestBody(id: "foo") {
        RequestBody(
            description: "This is a proper request body",
            content: [
                .json: Content(schema: testSchemaID)
            ]
        )
    }

    let okResponseID = builder.response(id: "foo") {
        Response(
            description: "foo",
            headers: [
                "X-Custom-Response-Header": headerID
            ],
            content: [
                .aac: Content(schema: testSchemaID)
            ]
        )
    }

    return .init(
        tags: ["main"],
        summary: "Detail example",
        description: "Detail example detail",
        parameters: [
            p1
        ],
        requestBody: requestBodyID,
        responses: [
            200: okResponseID
        ]
    )
}
