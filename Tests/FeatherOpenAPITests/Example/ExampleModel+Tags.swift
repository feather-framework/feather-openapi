//
//  ExampleModel+Tags.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 25..

import FeatherOpenAPI

extension Example.Model {

    struct ModelTag: TagRepresentable {
        var name: String { "Model" }
    }
}
