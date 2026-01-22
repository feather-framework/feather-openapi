//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit30
import Foundation

struct ExampleMissingParentItemItemDocument: Document {

    let components: [Component.Type]

    init() {
        self.components = [
            ExampleMissingParentItem.Model.self
        ]
    }

    func openAPIDocument() throws -> OpenAPI.Document {
        try composedDocument(
            info: .init(
                title: "ExampleMissingParentItem",
                description: """
                    Example API description
                    """,
                contact: .init(
                    name: "Binary Birds",
                    url: .init(string: "https://binarybirds.com")!,
                    email: "info@binarybirds.com"
                ),
                version: "1.0.0"
            ),
            servers: [
                .init(
                    url: .init(string: "http://localhost:8080")!,
                    description: "dev"
                )
            ]
        )
    }
}
