//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI
import OpenAPIKit30


struct ExampleFieldId: StringSchemaRepresentable {

    var title: String? { "foo" }
}

public struct ExampleFieldName: StringSchemaRepresentable {
    
    public var example: String?
    
    public init(
        example: String? = "John Doe"
    ) {
        self.example = example
    }
}

struct TodoIDField: IntSchemaRepresentable {
    var example: Int? { 1 }
}

struct TodoTitleField: StringSchemaRepresentable {
    var example: String? { "Buy milk" }
}

struct TodoIsCompleteField: BoolSchemaRepresentable {

}

struct TodoDetailObject: ObjectSchemaRepresentable {
    
    var propertyMap: SchemaMap {
        [
            "id": TodoIDField(),
            "title": TodoTitleField(),
            "isComplete": TodoIsCompleteField(),
            // TODO: move required to schema -> use that to reference
            "foo": SchemaReference(TodoIDField(), required: false),
//            "foo": TodoIDField().reference(id: "lorem"),
        ]
    }

}

struct TodoCreateRequestBody: RequestBodyRepresentable {
    
    var contentMap: ContentMap {
        [
            :
//            .json: TodoDetailObject()
        ]
    }
}

struct TodoCreateResponse: JSONResponseRepresentable {
    var description: String = "Todo response"
    var schema = TodoDetailObject()
}


struct TodoCreateOperation: OperationRepresentable {

    var requestBody = TodoCreateRequestBody()
    var responseMap: ResponseMap {
        [
            200: TodoCreateResponse(),
        ]
    }
}


struct TodoPathItems: PathItemRepresentable {
    var post: OperationRepresentable? = TodoCreateOperation()
}
