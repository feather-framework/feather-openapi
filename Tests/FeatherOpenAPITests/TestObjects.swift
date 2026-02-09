//
//  TestObjects.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI
import OpenAPIKit30

struct MyPathCollection: PathCollectionRepresentable {

    var pathMap: PathMap {
        [
            "todos": TodoPathItems()
                //                    "laci": LaciPathItems(),
        ]
    }
}

struct MyInfo: InfoRepresentable {
    var title: String { "foo" }
    var version: String { "1.0.0" }
}

struct MyDocument: DocumentRepresentable {

    var info: OpenAPIInfoRepresentable

    var servers: [any OpenAPIServerRepresentable] {
        [
            TestServer()
        ]
    }

    var paths: PathMap
    var components: OpenAPIComponentsRepresentable

    init(
        info: OpenAPIInfoRepresentable,
        paths: PathMap,
        components: OpenAPIComponentsRepresentable
    ) {
        self.info = info
        self.paths = paths
        self.components = components
    }
}

extension String: LocationRepresentable {
    public var location: String { self }
}

struct TestServer: ServerRepresentable {
    var url: any LocationRepresentable { "http://127.0.0.1:8080/" }
}

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
            "isComplete": TodoIsCompleteField().reference(required: false),
            //            "unsafe": UnsafeSchemaReference("asdf"),
        ]
    }

}

struct TodoCreateRequestBody: RequestBodyRepresentable {

    var contentMap: ContentMap {
        [
            .json: Content(TodoDetailObject().reference())
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
            TodoIdParameter().reference()
        ]
    }

    var requestBody: RequestBodyRepresentable? {
        TodoCreateRequestBody().reference()
    }

    var responseMap: ResponseMap {
        [
            200: TodoCreateResponse().reference()
        ]
    }

    var security: [any SecurityRequirementRepresentable]? {
        [
            OAuthSecurityRequirement(),
            APIKeySecurityRequirement(),
        ]
    }

    var servers: [any ServerRepresentable]? {
        [
            TestServer()
        ]
    }
}

struct TodoPathItems: PathItemRepresentable {
    var post: OperationRepresentable? = TodoCreateOperation()
}

struct OAuthSecurityScheme: SecuritySchemeRepresentable {

    var type: OpenAPIKit30.OpenAPI.SecurityScheme.SecurityType = .oauth2(
        flows: .init()
    )
}

struct OAuthSecurityRequirement: SecurityRequirementRepresentable {

    var security: any SecuritySchemeRepresentable = OAuthSecurityScheme()
    var requirements: [String] = ["read"]
}

struct APIKeySecurityScheme: SecuritySchemeRepresentable {

    var type: OpenAPIKit30.OpenAPI.SecurityScheme.SecurityType = .apiKey(
        name: "test",
        location: .header
    )
}

struct APIKeySecurityRequirement: SecurityRequirementRepresentable {

    var security: any SecuritySchemeRepresentable = APIKeySecurityScheme()
}

// MARK: -

struct TagDedupInfo: InfoRepresentable {
    var title: String { "Tag Dedup Test" }
    var version: String { "1.0.0" }
}

struct TagDedupDocument: DocumentRepresentable {
    var info: OpenAPIInfoRepresentable
    var paths: PathMap
    var components: OpenAPIComponentsRepresentable
}

struct TagDedupPaths: PathCollectionRepresentable {
    var pathMap: PathMap {
        [
            "dogs": TagDedupDogPathItem()
        ]
    }
}

struct TagDedupDogPathItem: PathItemRepresentable {
    var get: OperationRepresentable? { TagDedupListDogsOperation() }
    var post: OperationRepresentable? { TagDedupCreateDogOperation() }
}

struct TagDedupDogTag: TagRepresentable {
    var name: String = "Dogs"
    var description: String? = "Manage dogs."
}

struct TagDedupDogSchema: StringSchemaRepresentable {
    var example: String? = "Hachi"
}

struct TagDedupDogResponse: JSONResponseRepresentable {
    var description: String = "Dog response"
    var schema: TagDedupDogSchema = TagDedupDogSchema()
}

struct TagDedupListDogsOperation: OperationRepresentable {
    var tags: [TagRepresentable] { [TagDedupDogTag()] }
    var responseMap: ResponseMap {
        [
            200: TagDedupDogResponse().reference()
        ]
    }
}

struct TagDedupCreateDogOperation: OperationRepresentable {
    var tags: [TagRepresentable] { [TagDedupDogTag()] }
    var responseMap: ResponseMap {
        [
            200: TagDedupDogResponse().reference()
        ]
    }
}
