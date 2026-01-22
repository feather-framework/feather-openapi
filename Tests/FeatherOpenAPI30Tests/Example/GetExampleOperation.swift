//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30

extension SchemaID {
    static var exampleID: Self { .init(#function) }
}

func registerSchemes(
    using builder: inout ComponentBuilder
) {
    let idSchema = builder.schema(id: "ExampleId") {
        StringSchema()
    }
}

func getExample(
    using builder: inout ComponentBuilder
) -> Operation {

    registerSchemes(using: &builder)

    let exampleId = try! builder.getSchemaID("ExampleId")

    let titleSchema = builder.schema(id: "ExampleTitle") {
        StringSchema()
    }

    let detailSchema = builder.schema(id: "ExampleDetail") {
        return JSONSchema.object(
            properties: [
                "id": .reference(.component(named: exampleId.rawValue)),
                "title": .reference(.component(named: titleSchema.id.rawValue)),
            ]
        )
        //        ObjectSchema(
        //            properties: [
        //                "id": StringSchema(),
        //                "title": StringSchema(),
        //            ]
        //        )
    }

    let idParameter = builder.parameter(id: "ExampleId") {
        Parameter(
            name: "id",
            context: .path,
            schema: exampleId
        )
        .openAPIParameter()
    }

    let okResponse = builder.response(id: "GetExampleResponse") {
        return Response(
            description: "Example detail response",
            //            headers: [
            //                "X-Custom-Response-Header": header.id
            //            ],
            content: [
                .aac: Content(schema: detailSchema.id)
            ]
        )
    }

    return .init(
        tags: ["main"],
        summary: "Detail example",
        description: "Detail example detail",
        parameters: [
            idParameter.id
        ],
        responses: [
            200: okResponse.id
        ]
    )
}
