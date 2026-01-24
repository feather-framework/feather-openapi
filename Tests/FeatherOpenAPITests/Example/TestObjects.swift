//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI
import OpenAPIKit30


struct TodoIDField: IntSchemaRepresentable {
    var example: Int? { 1 }
}

struct TodoTitleField: StringSchemaRepresentable {
    var example: String? = "Buy milk"
}

struct TodoIsCompleteField: BoolSchemaRepresentable {

}

struct TodoDetailObject: ObjectSchemaRepresentable {
    
    var propertyMap: SchemaMap {
        [
            "id": TodoIDField().reference(),
            "title": TodoTitleField(),
            "isComplete": TodoIsCompleteField(),
//            "unsafe": UnsafeSchemaReference("asdf"),
        ]
    }

}

struct TodoCreateRequestBody: RequestBodyRepresentable {
    
    var contentMap: ContentMap {
        [
            .json: Content(TodoDetailObject().reference()),
        ]
    }
}

struct TodoCreateResponse: JSONResponseRepresentable {
    var description: String = "Todo response"
    var schema = TodoDetailObject().reference()

    var headerMap: HeaderMap {
        [
            "x-custom-header": CustomHeader().reference()
        ]
    }
}

struct TodoIdParameter: ParameterRepresentable {
    
    var name: String { "todoId" }
    var context: OpenAPIKit30.OpenAPI.Parameter.Context {
        .path
    }
    var schema: any OpenAPISchemaRepresentable {
        TodoIDField().reference()
    }
}

struct CustomHeader: HeaderRepresentable {
    var schema: any OpenAPISchemaRepresentable {
        TodoIDField().reference()
    }
}

struct TodoTag: TagRepresentable {
    var name: String = "Todos"
    var description: String? = "This is the todo tag."
}

struct TodoCreateOperation: OperationRepresentable {

    var tags: [TagRepresentable] {
        [
            TodoTag()
        ]
    }

    var parameters: [ParameterRepresentable] {
        [
            TodoIdParameter().reference(),
        ]
    }

    var requestBody: RequestBodyRepresentable? {
        TodoCreateRequestBody().reference()
    }

    var responseMap: ResponseMap {
        [
            200: TodoCreateResponse().reference(),
        ]
    }
}


struct TodoPathItems: PathItemRepresentable {
    var post: OperationRepresentable? = TodoCreateOperation()
}
