//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30

func testOperation(
    using builder: inout ComponentBuilder
) -> Operation {

    let testSchemaID = builder.schema(id: "TestSchema") {
        StringSchema()
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
        RequestBody(
            description: "This is a proper request body",
            content: [
                .json: Content(schema: testSchemaID)
            ]
        )
    }

    let response1 = builder.response(id: "foo") {
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
        parameters: [
            p1
        ],
        requestBody: reqBody1,
        responses: [
            200: response1
        ]
    )
}
