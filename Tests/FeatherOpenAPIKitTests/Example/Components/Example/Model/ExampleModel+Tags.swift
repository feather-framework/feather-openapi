//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    static var tags: [Tag.Type] {
        [
            Tags.Main.self
        ]
    }

    enum Tags {

        enum Main: Tag {
            static let name = "Model"
        }
    }
}
