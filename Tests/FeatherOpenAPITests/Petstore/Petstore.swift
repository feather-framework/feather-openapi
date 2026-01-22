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

    let petObjectID = builder.schema(id: "Pet") {
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
    
    let petIdSchemaID = builder.schema(id: "petId") {
        JSONSchema.integer(format: .int64, example: 10)
    }
    
    let parameter = builder.parameter(id: "petId") {
        OpenAPI.Parameter(
            name: "petId",
            context: .path,
            schema: JSONSchema.string,
            description: "ID of pet to return"
        )
    }
    
//    let parameter = builder.parameter(id: "petId") {
//        Parameter(
//            name: <#T##String#>,
//            context: <#T##OpenAPI.Parameter.Context#>,
//            schema: <#T##SchemaID#>
//        )
//    }
    
    

    

    let okResponseID = builder.response(id: "okResponse") {
        OpenAPI.Response(
            description: "successful operation",
            content: [
                .json: .init(schema: .reference(.component(named: petObjectID.rawValue))),
                .xml: .init(schema: .reference(.component(named: petObjectID.rawValue))),
            ],
        )
    }
    
    let operation = OpenAPI.Operation(
        responses: [
            .status(code: 200): .reference(.component(named: okResponseID.rawValue))
        ]
    )
}



//Components {
//    Schemas {
//        FooSchema()
//        BarSchema()
//    }
//    Responses {
//        TodoListResponse()
//    }
//}
//
//Operation {
//    Id("foo")
//    Description("foo br baz")
//    RequestBody {
//        BarSchema()
//    }
//    Responses {
//        Status(code: 200) {
//            Description("Succesful operation")
//            Response(id: "foo") {
//                Content(json) {
//                    FooSchema()
//                        .inline()
//                }
//            }
//        }
//    }
//}
