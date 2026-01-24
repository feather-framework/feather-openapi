//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import Foundation
import OpenAPIKit30
import OpenAPIKitCore
import Yams
import Testing

@testable import FeatherOpenAPI

@Suite
struct PetstoreOpenAPIKitTests {

    @Test
    func render() throws {

        let document = PetstoreDocument()

        let encoder = YAMLEncoder()
        let openAPIDocument = try document.openAPIDocument()

        do {
            _ =
                try openAPIDocument
                .locallyDereferenced()
                .resolved()
        }
        catch {
            Issue.record("\(error)")
            return
        }

        let output = try encoder.encode(openAPIDocument)

        print(output)
    }
}
