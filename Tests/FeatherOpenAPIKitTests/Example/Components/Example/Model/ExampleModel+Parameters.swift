//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    static var parameters: [Parameter.Type] {
        [
            Parameters.Id.self,
            Parameters.CustomRequestHeader.self,
        ]
    }

    enum Parameters {

        enum Id: PathParameter {
            static let name = "id"
            static let description = "Example parameter"
            static var schema: Schema.Type { Schemas.Id.self }
        }

        enum CustomRequestHeader: HeaderParameter {
            static let name = "CustomRequestHeader"
            static let description = "Example request header parameter"
            static var schema: Schema.Type { Schemas.CustomHeader.self }
        }
    }
}
