//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    static var headers: [Header.Type] {
        [
            Headers.CustomResponseHeader.self
        ]
    }

    enum Headers {

        enum CustomResponseHeader: Header {
            static let name = "X-Custom-Response-Header"
            static let description: String = "My custom response header"
            static var schema: Schema.Type { Schemas.CustomHeader.self }
        }
    }
}
