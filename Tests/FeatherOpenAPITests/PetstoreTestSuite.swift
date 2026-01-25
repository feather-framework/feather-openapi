//
//  PetstoreTestSuite.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import Foundation
import OpenAPIKit30
import OpenAPIKitCore
import Testing
import Yams

@testable import FeatherOpenAPI

@Suite
struct PetstoreTestSuite {

    @Test
    func render() throws {

        let document = PetstoreDocument()

        let encoder = YAMLEncoder()
        let openAPIDocument = document.openAPIDocument()

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
