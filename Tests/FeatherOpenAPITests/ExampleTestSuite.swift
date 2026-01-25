//
//  ExampleTestSuite.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

import Foundation
import OpenAPIKit
import OpenAPIKit30
import OpenAPIKitCompat
import Testing
import Yams

@testable import FeatherOpenAPI

@Suite
struct ExampleTestSuite {

    @Test
    func render() throws {

        let document = ExampleDocument()

        let openAPIdoc = document.openAPIDocument()
        _ = try openAPIdoc.locallyDereferenced().resolved()

        let encoder = YAMLEncoder()
        let result = try encoder.encode(openAPIdoc)
        print("---- 3.0 ----")
        print(result)
    }

    @Test
    func duplicatedItem() throws {

        let document = ExampleDuplicatedItemDocument()

        let openAPIdoc = document.openAPIDocument()
        _ = try openAPIdoc.locallyDereferenced().resolved()

        let encoder = YAMLEncoder()
        let result = try encoder.encode(openAPIdoc)
        print("---- 3.0 ----")
        print(result)
    }

    @Test
    func missingParentItem() throws {

        let document = ExampleMissingParentItemItemDocument()

        let openAPIdoc = document.openAPIDocument()
        _ = try openAPIdoc.locallyDereferenced().resolved()

        let encoder = YAMLEncoder()
        let result = try encoder.encode(openAPIdoc)
        print("---- 3.0 ----")
        print(result)
    }
}
