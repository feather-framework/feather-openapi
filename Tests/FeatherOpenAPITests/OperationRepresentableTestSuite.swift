//
//  OperationRepresentableTestSuite.swift
//  feather-openapi
//
//  Created by Codex on 2026. 03. 24.
//

import OpenAPIKit30
import Testing

@testable import FeatherOpenAPI

private enum OperationIdFixture {

    struct ListPetsOperation: OperationRepresentable {
        var responseMap: ResponseMap {
            [.default: EmptyResponse()]
        }
    }

    struct ListPets: OperationRepresentable {
        var responseMap: ResponseMap {
            [.default: EmptyResponse()]
        }
    }

    struct EmptyResponse: ResponseRepresentable {
        let description = "ok"
        let openAPIIdentifier = "OperationIdFixtureEmptyResponse"
        var contentMap: ContentMap { [:] }
    }
}

@Suite
struct OperationRepresentableTestSuite {

    @Test
    func defaultOperationIdUsesOperationTypeName() {
        let operation = OperationIdFixture.ListPetsOperation()

        #expect(operation.operationId == "listPets")
    }

    @Test
    func defaultOperationIdIsNilWhenTypeHasNoOperationSuffix() {
        let operation = OperationIdFixture.ListPets()

        #expect(operation.operationId == nil)
    }
}
