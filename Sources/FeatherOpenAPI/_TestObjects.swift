//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

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
    
    var properties: OrderedDictionary<String, OpenAPISchemaRepresentable> {
        [
            "id": TodoIDField(),
            "title": TodoTitleField(),
            "isComplete": TodoIsCompleteField(),
            "foo": SchemaReference(TodoIDField(), required: false),
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
