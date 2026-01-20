//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    static var requestBodies: [RequestBody.Type] {
        [
            RequestBodies.Create.self
        ]
    }

    enum RequestBodies {

        enum Create: JSONBody {
            static let description = "Create example"
            static var schema: Schema.Type { Schemas.Create.self }
        }
    }
}
