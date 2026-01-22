//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI
import OpenAPIKit30

func getExample(
    using builder: inout ComponentBuilder
) -> Operation {

    let exampleID = builder.schema(id: "ExampleId") {
        StringSchema()
    }

    let titleSchemaID = builder.schema(id: "ExampleTitle") {
        StringSchema()
    }

    let detailSchema = builder.schema(id: "ExampleDetail") {
        return JSONSchema.object(
            properties: [
                "id": .reference(.component(named: exampleID.rawValue)),
                "title": .reference(.component(named: titleSchemaID.rawValue)),
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
            schema: exampleID
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
                .aac: Content(schema: detailSchema)
            ]
        )
    }

    return .init(
        tags: ["main"],
        summary: "Detail example",
        description: "Detail example detail",
        parameters: [
            idParameter
        ],
        responses: [
            200: okResponse
        ]
    )
}
