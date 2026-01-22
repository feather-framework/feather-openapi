//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI
import OpenAPIKit30

func createExample(
    using builder: inout ComponentBuilder
) -> Operation {

    let testSchemaID = builder.schema(id: "TestSchema") {
        JSONSchema.string
    }

    let headerID = builder.header(id: "header") {
        Header(schema: testSchemaID)
    }

    let p1 = builder.parameter(id: "foo") {
        .init(name: "foo", context: .path, schema: .string)
    }

    let requestBodyID = builder.requestBody(id: "foo") {
        OpenAPI.Request(
            description: "This is a proper request body",
            content: [
                :
//                .json: Content(schema: testSchemaID).openAPIContent(),
            ]
        )
    }

    let okResponseID = builder.response(id: "foo") {
        OpenAPI.Response(
            description: "foo",
            headers: [
                "X-Custom-Response-Header": .reference(.component(named: ""))
            ],
            content: [
                :
//                .aac: Content(schema: testSchemaID)
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
