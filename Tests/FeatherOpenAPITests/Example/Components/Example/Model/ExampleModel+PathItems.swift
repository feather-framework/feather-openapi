//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPI

extension Example.Model {

    static let pathItems: [PathItem.Type] = [
        PathItems.Main.self,
        PathItems.Identified.self,
    ]

    enum PathItems {

        enum Main: PathItem {
            static let path: Path = "/example/models"

            static let post: Operation.Type? = Operations.Create.self
        }

        enum Identified: PathItem {
            static let path: Path = Main.path / Parameters.Id.path
            static let parameters: [Parameter.Type] = [
                Parameters.Id.self
            ]

            static let get: Operation.Type? = Operations.Get.self
        }

    }
}
