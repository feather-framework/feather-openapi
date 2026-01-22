//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import FeatherOpenAPIKit

extension ExampleDuplicatedItem {

    enum Model: Component {

        static func getComponentsOfType<T>() -> [T] {
            let prefixName = String(reflecting: self) + "."
            return [
                Schemas.self
            ]
            .compactMap { $0 as? T }
            .filter {
                String(reflecting: $0).hasPrefix(prefixName)
            }
        }
    }
}
