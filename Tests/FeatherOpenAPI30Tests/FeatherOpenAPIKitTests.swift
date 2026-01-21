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

@testable import FeatherOpenAPI30

@Suite
struct FeatherOpenAPIKitTests {

    @Test
    func example() throws {

        let doc = Document(
            info: Info(
                title: "foo",
                version: "1.0.0"
            ),
            paths: [
                "foo": PathItem(
                    get: Operation(
                        parameters: [
                            .foo
                        ],
                        requestBody: .foo,
                        responses: [
                            200: .foo
                        ]
                    )
                )
            ],
            components: Components(
                schemas: [
                    .test: StringSchema(),
                    .customResponseHeader: StringSchema.customResponseHeader,
                ],
                parameters: [
                    .foo: Parameter.foo
                ],
                responses: [
                    .foo: Response(
                        description: "foo",
                        headers: [
                            "X-Custom-Response-Header": .customResponse
                        ],
                        content: [
                            .aac: Content(schema: .test)
                        ],
                    )
                ],
                requestBodies: [
                    .foo: RequestBody(
                        content: [
                            .any: Content(schema: .test)
                        ]
                    )
                ],
                headers: [
                    .customResponse: Header.customResponse
                ]
            ),
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

        let paths: OpenAPIKit30.OpenAPI.PathItem.Map = [
            "foo": .init(
                .init(
                    summary: "foo",
                    description: nil,
                    servers: nil,
                    parameters: [],
                    get: .init(
                        requestBody: .init(
                            .component(
                                named: "foo"
                            )
                        ),
                        responses: [:]
                    ),
                    put: nil,
                    post: nil,
                    delete: nil,
                    options: nil,
                    head: nil,
                    patch: nil,
                    trace: nil,
                    vendorExtensions: [:]
                )
            )
        ]

        let doc = OpenAPIKit30.OpenAPI.Document(
            info: .init(
                title: "foo",
                version: "3.0.0"
            ),
            servers: [],
            paths: paths,
            components: .init(
                schemas: [
                    "schemaID": .string(
                        format: .dateTime,
                        required: true,
                        nullable: false,
                        permissions: nil,
                        deprecated: nil,
                        title: nil,
                        description: nil,
                        discriminator: nil,
                        externalDocs: nil,
                        minLength: nil,
                        maxLength: nil,
                        pattern: nil,
                        allowedValues: nil,
                        defaultValue: nil,
                        example: "Foo"
                    )
                ],
                responses: .init(),
                parameters: .init(),
                examples: .init(),
                requestBodies: [
                    "foo": .init(
                        description: "foo",
                        content: [
                            .json: .init(
                                schemaReference: .component(named: "schemaID")
                            )
                        ],
                        required: true,
                        vendorExtensions: [:]
                    )
                ],
                headers: .init(),
                securitySchemes: .init(),
                links: .init(),
                callbacks: .init(),
                vendorExtensions: .init()
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
