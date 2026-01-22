//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import Foundation
import OpenAPIKit
import OpenAPIKit30
import OpenAPIKitCompat
import Yams
import Testing

@testable import FeatherOpenAPI

@Suite
struct FeatherOpenAPIKitTests {

    @Test
    func ttt() {
        let schema = ExampleFieldId()
        print(schema.openAPIIdentifier)
    }

    
    @Test
    func ref() throws {

        struct UserId: OpenAPISchemaRepresentable {

            func openAPISchema() -> OpenAPIKit30.JSONSchema {
                fatalError()
            }
        }

        struct Reference<T> {

            static func toSchemaRef() {
                print(T.self)
            }
        }

        Reference<UserId>.self.toSchemaRef()
    }

    @Test
    func example() throws {

        var builder = ComponentBuilder()

        let getExampleOperation = getExample(using: &builder)
        //        let createExampleOperation = createExample(using: &builder)

        let doc = Document(
            info: Info(
                title: "foo",
                version: "1.0.0"
            ),
            paths: [
                "examples": PathItem(
                    summary: "Example related operations",
                    get: getExampleOperation,
                    //                    post: createExampleOperation
                )
            ],
            components: builder.components
        )

        let openAPIdoc = doc.openAPIDocument()

        let encoder = YAMLEncoder()

        do {
            _ =
                try openAPIdoc
                .locallyDereferenced()
                .resolved()
        }
        catch {
            print(error)
            throw error
        }

        let result = try encoder.encode(openAPIdoc)
        print(result)

    }

    func renderTest() throws {

        let doc = OpenAPIKit30.OpenAPI.Document(
            info: .init(
                title: "foo",
                version: "3.0.0"
            ),
            servers: [],
            paths: [
                "foo": .init(
                    .init(
                        summary: "foo",
                        get: .init(
                            requestBody: .init(
                                .component(
                                    named: "foo"
                                )
                            ),
                            responses: [:]
                        ),
                    )
                )
            ],
            components: .init(
                schemas: [
                    "schemaID": .string(
                        format: .dateTime,
                        example: "Foo"
                    )
                ],
                requestBodies: [
                    "foo": .init(
                        description: "foo",
                        content: [
                            .json: .init(
                                schemaReference: .component(named: "schemaID")
                            )
                        ]
                    )
                ],
            )
        )

        let encoder = YAMLEncoder()

        do {
            _ =
                try doc
                .locallyDereferenced()
                .resolved()
        }
        catch {
            print(type(of: error))
            print(error)
            throw error
        }

        let result = try encoder.encode(doc)
        print("---- 3.0 ----")
        print(result)

        let doc31 = doc.convert(to: .v3_1_0)
        let result31 = try encoder.encode(doc31)
        print("---- 3.1 ----")
        print(result31)

        let doc32 = doc.convert(to: .v3_2_0)
        let result32 = try encoder.encode(doc32)
        print("---- 3.2 ----")
        print(result32)

    }
}
