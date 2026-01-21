//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import Foundation
import OpenAPIKit
import OpenAPIKitCore
import Yams
import Testing

@testable import FeatherOpenAPI

@Suite
struct FeatherOpenAPIKitTests {

    @Test
    func render() throws {

        let document = ExampleDocument()

        #expect(
            try document.schemas()
                .contains {
                    $0.key.rawValue == "ExampleModelPatch"
                        && $0.value.description == "overridden"
                }
        )

        let encoder = YAMLEncoder()
        let openAPIDocument = try document.openAPIDocument()
        do {
            _ = try openAPIDocument.locallyDereferenced()
        }
        catch {
            Issue.record("\(error)")
            return
        }

        let output = try encoder.encode(openAPIDocument)

        print(output)
    }

    @Test
    func schemaDescription() throws {

        struct IDSchema: NanoIDSchema {}
        struct Foo: NanoIDSchema {}

        #expect(IDSchema.description == "ID description")
        #expect(Foo.description == "Foo description")
    }

    @Test
    func duplicatedItem() throws {

        let document = ExampleDuplicatedItemDocument()
        var errorMessage: String = "none"

        do {
            let _ = try document.openAPIDocument()
        }
        catch let error as ComposeDocumentError {
            errorMessage = error.message
        }

        #expect(
            errorMessage
                == "Feather OpenAPI item id is duplicated: 'ExampleDuplicatedItemModelKey' (Did you forget to include override=true?)"
        )
    }

    @Test
    func missingParentItem() throws {

        let document = ExampleMissingParentItemItemDocument()
        var errorMessage: String = "none"

        do {
            let _ = try document.openAPIDocument()
        }
        catch let error as ComposeDocumentError {
            errorMessage = error.message
        }

        #expect(
            errorMessage
                == "Feather OpenAPI item 'ExampleMissingParentItemModelKey' is set as override but has no parent. (Are the component orders correct? Or are the IDs the same?)"
        )
    }

}
