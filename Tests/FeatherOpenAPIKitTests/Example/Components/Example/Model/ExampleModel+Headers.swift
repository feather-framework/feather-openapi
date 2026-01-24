//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    struct CustomResponseHeader: HeaderRepresentable {
        var description: String? { "My custom response header" }
        var schema: any OpenAPISchemaRepresentable {
            CustomHeaderSchema().reference()
        }
    }
}
