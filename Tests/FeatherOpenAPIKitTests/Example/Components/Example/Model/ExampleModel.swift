//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import FeatherOpenAPIKit

extension Example {

    enum Model: Component {
        static func getComponentsOfType<T>() -> [T] {
            let prefixName = String(reflecting: self) + "."
            return [
                Headers.self,
                Operations.self,
                Parameters.self,
                PathItems.self,
                RequestBodies.self,
                Responses.self,
                Schemas.self,
                SecuritySchemes.self,
                Tags.self,
            ]
            .compactMap { $0 as? T }
            .filter {
                String(reflecting: $0).hasPrefix(prefixName)
            }
        }
    }
}
