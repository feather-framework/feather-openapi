//
//  ExampleModel+Headers.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

import FeatherOpenAPI

extension Example.Model {

    struct CustomResponseHeader: HeaderRepresentable {
        var description: String? { "My custom response header" }
        var schema: any OpenAPISchemaRepresentable {
            CustomHeaderSchema().reference()
        }
    }
}
