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
    func example() throws {

        struct MyPathCollection: PathCollectionRepresentable {
            
            var pathMap: PathMap {
                [
                    "todos": TodoPathItems()
                ]
            }
        }
        
        let collection = MyPathCollection()
        
        let document = Document(
            info: Info(
                title: "foo",
                version: "1.0.0"
            ),
            paths: collection.pathMap.mapValues { $0.openAPIPathItem() },
            components: collection.components
        )

        let openAPIdoc = document.openAPIDocument()

        let encoder = YAMLEncoder()

        _ = try openAPIdoc
            .locallyDereferenced()
            .resolved()

        let result = try encoder.encode(openAPIdoc)
        print("---- 3.0 ----")
        print(result)

        let doc31 = openAPIdoc.convert(to: .v3_1_0)
        let result31 = try encoder.encode(doc31)
        print("---- 3.1 ----")
        print(result31)

        let doc32 = openAPIdoc.convert(to: .v3_2_0)
        let result32 = try encoder.encode(doc32)
        print("---- 3.2 ----")
        print(result32)

    }
}
