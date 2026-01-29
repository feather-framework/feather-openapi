//
//  PetstoreTestSuite.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30
import Testing
import Yams

@testable import FeatherOpenAPI

@Suite
struct PetstoreTestSuite {

    @Test
    func render() throws {

        let document = PetstoreDocument()

        let encoder = YAMLEncoder()
        let openAPIdoc = document.openAPIDocument()

        do {
            _ =
                try openAPIdoc
                .locallyDereferenced()
                .resolved()
        }
        catch {
            Issue.record("\(error)")
            return
        }

        let result = try encoder.encode(openAPIdoc)
        print("---- 3.0 ----")
        print(result)
    }
}
