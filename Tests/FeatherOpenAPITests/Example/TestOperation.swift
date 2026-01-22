//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI
import OpenAPIKit30

func testOperation(
    using builder: inout ComponentBuilder
) -> Operation {

    let testSchemaID = builder.schema(id: "TestSchema") {
        JSONSchema.string
    }

    let headerID = builder.header(id: "header") {
        Header(schema: testSchemaID)
    }

    let p1 = builder.parameter(id: "foo") {
        Parameter(
            name: "foo",
            context: .path,
            schema: testSchemaID
        )
        .openAPIParameter()
    }

    let reqBody1 = builder.requestBody(id: "foo") {
        OpenAPI.Request(
            description: "This is a proper request body",
            content: [
                :
//                .json: Content(schema: testSchemaID).openAPIContent(),
            ]
        )
    }

    let response1 = builder.response(id: "foo") {
        OpenAPI.Response(
            description: "foo",
            headers: [
                "X-Custom-Response-Header": .a(.component(named: ""))
            ],
            content: [
                :
//                .aac: Content(schema: testSchemaID)
            ]
        )
    }

    return .init(
        parameters: [
            p1
        ],
        requestBody: reqBody1,
        responses: [
            200: response1
        ]
    )
}
