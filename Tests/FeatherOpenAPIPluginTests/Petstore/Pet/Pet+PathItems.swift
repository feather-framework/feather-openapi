//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    enum PathItems {

        enum Main: PathItem {
            static var path: Path { "/pet" }
            //
            //            static var post: Operation.Type? { Operations.Create.self }
        }

        enum Identified: PathItem {
            static var path: Path { Main.path / Parameters.Id.path }
            static var parameters: [Parameter.Type] {
                [
                    Parameters.Id.self
                ]
            }

            static var get: Operation.Type? { Operations.Get.self }
        }

    }
}
