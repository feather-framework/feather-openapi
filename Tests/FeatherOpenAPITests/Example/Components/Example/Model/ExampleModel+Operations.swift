//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    static var operations: [Operation.Type] {
        [
            Operations.Get.self,
            Operations.Create.self,
        ]
    }

    enum Operations {

        enum Get: Operation {
            static var tag: Tag.Type { Tags.Main.self }
            static let summary = "Detail example"
            static let description = "Detail example detail"
            static var parameters: [Parameter.Type] {
                [
                    //                Parameters.Id.self,
                    Parameters.CustomRequestHeader.self
                ]
            }
            static var responses: [OperationResponse] {
                [
                    .init(200, Responses.Detail.self)
                ]
            }
        }

        enum Create: Operation {

            static var tag: Tag.Type { Tags.Main.self }
            static var summary: String { "Create example" }
            static var description: String { "Create example detail" }
            static var requestBody: RequestBody.Type? {
                RequestBodies.Create.self
            }
            static var responses: [OperationResponse] {
                [
                    .init(200, Responses.Detail.self)
                ]
            }
            static var security: [SecurityScheme.Type] {
                [
                    SecuritySchemes.BearerToken.self
                ]
            }
        }

    }
}
