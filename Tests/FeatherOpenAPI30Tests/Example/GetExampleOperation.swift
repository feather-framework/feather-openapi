//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30
import OpenAPIKit30


func getExample(
    using builder: inout ComponentBuilder
) -> Operation {

    let idSchema = builder.schema(id: "ExampleId") {
        StringSchema()
    }
    
    let titleSchema = builder.schema(id: "ExampleTitle") {
        StringSchema()
    }

    let detailSchema = builder.schema(id: "ExampleDetail") {
        ObjectSchema(
            properties: [
                "id": StringSchema(),
                "title": StringSchema(),
            ]
        )
    }
    
   
    
    let idParameter = builder.parameter(id: "ExampleId") {
        Parameter(
            name: "id",
            context: .path,
            schema: idSchema.id
        )
    }
    
    let okResponse = builder.response(id: "GetExampleResponse") {
        Response(
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
            idParameter.id,
        ],
        responses: [
            200: okResponse.id
        ]
    )
}

