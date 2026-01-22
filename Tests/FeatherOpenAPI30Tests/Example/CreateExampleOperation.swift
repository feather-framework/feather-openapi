//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30

extension ComponentBuilder {

    mutating func todoTitle() -> SchemaID {
        let sch1 = schema(id: #function) {
            StringSchema()
        }
        return sch1.id
    }
}

enum Model {
    struct PetSchemaBuilder {

        var builder: ComponentBuilder

        mutating func title() -> SchemaID {
            let sch1 = builder.schema(id: #function) {
                StringSchema()
            }
            return sch1.id
        }
    }
}

func createExample(
    using builder: inout ComponentBuilder
) -> Operation {

    let sch1 = builder.schema(id: "TestSchema") {
        StringSchema()
    }

    //        let sch2 = builder.schema(id: "todo.id") {
    //            StringSchema()
    //        }

    let header = builder.header(id: "header") {
        Header(schema: sch1.id)
    }

    let p1 = builder.parameter(id: "foo") {
        .init(name: "foo", context: .path, schema: .string)
    }

    let reqBody1 = builder.requestBody(id: "foo") {
        RequestBody(
            description: "This is a proper request body",
            content: [
                .json: Content(schema: sch1.id)
            ]
        )
    }

    let okResponse = builder.response(id: "foo") {
        Response(
            description: "foo",
            headers: [
                "X-Custom-Response-Header": header.id
            ],
            content: [
                .aac: Content(schema: sch1.id)
            ]
        )
    }

    return .init(
        tags: ["main"],
        summary: "Detail example",
        description: "Detail example detail",
        parameters: [
            p1.id
        ],
        requestBody: reqBody1.id,
        responses: [
            200: okResponse.id
        ]
    )
}
