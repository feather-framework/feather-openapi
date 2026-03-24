//
//  ResponseSerializationTestSuite.swift
//  feather-openapi
//
//  Created by Codex on 2026. 03. 24.
//

import OpenAPIKit30
import Testing
import Yams

@testable import FeatherOpenAPI

private struct EmptyHeadersResponse: ResponseRepresentable {
    let description = "Unauthorized"
    let openAPIIdentifier = "EmptyHeadersResponse"
    var contentMap: ContentMap { [:] }
}

private struct CustomHeaderResponse: ResponseRepresentable {
    let description = "Ok"
    let openAPIIdentifier = "CustomHeaderResponse"
    var contentMap: ContentMap { [:] }
    var headerMap: HeaderMap {
        [
            "x-request-id": RequestIdHeader()
        ]
    }
}

private struct RequestIdHeader: HeaderRepresentable {
    var schema: any OpenAPISchemaRepresentable { RequestIdSchema() }
}

private struct RequestIdSchema: StringSchemaRepresentable {}

@Suite
struct ResponseSerializationTestSuite {

    @Test
    func emptyHeaderMapDoesNotSerializeHeadersField() throws {
        let response = EmptyHeadersResponse().openAPIResponse()
        guard case .b(let openAPIResponse) = response else {
            Issue.record("Expected inline OpenAPI response")
            return
        }

        let yaml = try YAMLEncoder().encode(openAPIResponse)

        #expect(yaml.contains("headers:") == false)
    }

    @Test
    func nonEmptyHeaderMapStillSerializesHeadersField() throws {
        let response = CustomHeaderResponse().openAPIResponse()
        guard case .b(let openAPIResponse) = response else {
            Issue.record("Expected inline OpenAPI response")
            return
        }

        let yaml = try YAMLEncoder().encode(openAPIResponse)

        #expect(yaml.contains("headers:"))
        #expect(yaml.contains("x-request-id:"))
    }
}
