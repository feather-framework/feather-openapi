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
import XCTest

@testable import FeatherOpenAPI

final class FeatherOpenAPIKitTests: XCTestCase {

    func testRender() throws {

        let document = ExampleDocument()

        XCTAssert(
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
            return XCTFail("\(error)")
        }

        _ = try encoder.encode(openAPIDocument)
    }

    func testSchemaDescription() throws {

        struct IDSchema: NanoIDSchema {}
        struct Foo: NanoIDSchema {}

        XCTAssertEqual(IDSchema.description, "ID description")
        XCTAssertEqual(Foo.description, "Foo description")
    }

    func testDuplicatedItem() throws {

        let document = ExampleDuplicatedItemDocument()
        var errorMessage: String = "none"

        do {
            let _ = try document.openAPIDocument()
        }
        catch let error as ComposeDocumentError {
            errorMessage = error.message
        }

        XCTAssertEqual(
            errorMessage,
            "Feather OpenAPI item id is duplicated: 'ExampleDuplicatedItemModelKey' (Did you forget to include override=true?)"
        )
    }

    func testMissingParentItem() throws {

        let document = ExampleMissingParentItemItemDocument()
        var errorMessage: String = "none"

        do {
            let _ = try document.openAPIDocument()
        }
        catch let error as ComposeDocumentError {
            errorMessage = error.message
        }

        XCTAssertEqual(
            errorMessage,
            "Feather OpenAPI item 'ExampleMissingParentItemModelKey' is set as override but has no parent. (Are the component orders correct? Or are the IDs the same?)"
        )
    }

}
