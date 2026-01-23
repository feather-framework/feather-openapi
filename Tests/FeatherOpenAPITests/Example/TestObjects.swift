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
//    var openAPIIdentifier: String { "foo_\(example)" }
//    var openAPIIdentifierSuffix: String { String(example) }
    
//    init(example: Int? = 1) {
//        self.example = example
//    }
}

struct TodoTitleField: StringSchemaRepresentable {
    var example: String? = "Buy milk"
    
    
}

struct TodoIsCompleteField: BoolSchemaRepresentable {

}

struct TodoDetailObject: ObjectSchemaRepresentable {
    
    var propertyMap: SchemaMap {
        [
//            "id1": TodoIDField(example: 1).referenced(id: "foo"),
//            "id2": TodoIDField(example: 2).referenced(id: "bar"),
//            "id3": TodoIDField()
//                .inlined(example: 2)
//                .inlined(example: 123)
//                .inlined(), -> Self
//                .referenced() -> .component(named: "")
            "title": TodoTitleField(),
            "isComplete": TodoIsCompleteField(),
            // TODO: move required to schema -> use that to reference
//            "bar": SchemaReference(TodoIDField(), required: false),
//            "foo": TodoIDField(example: 12).referenced(id: ""),
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
    var schema = TodoDetailObject()
}

struct TodoIdParameter: ParameterRepresentable {
    
    var name: String { "todoId" }
    var context: OpenAPIKit30.OpenAPI.Parameter.Context { .path }
    var schema: any FeatherOpenAPI.OpenAPISchemaRepresentable { TodoIDField().reference() }
}


struct TodoCreateOperation: OperationRepresentable {

    var parameters: [ParameterRepresentable] {
        [
//            TodoIdParameter(),
            TodoIdParameter().reference(),
        ]
    }

    var requestBody: RequestBodyRepresentable? = TodoCreateRequestBody().reference()
    var responseMap: ResponseMap {
        [
            200: TodoCreateResponse(),
        ]
    }
}


struct TodoPathItems: PathItemRepresentable {
    var post: OperationRepresentable? = TodoCreateOperation()
}
