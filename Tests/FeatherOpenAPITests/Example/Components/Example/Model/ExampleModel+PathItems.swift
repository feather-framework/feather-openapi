//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    static var pathItems: [PathItem.Type] {
        [
            PathItems.Main.self,
            PathItems.Identified.self,
        ]
    }

    enum PathItems {

        enum Main: PathItem {
            static var path: Path { "/example/models" }

            static var post: Operation.Type? { Operations.Create.self }
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
