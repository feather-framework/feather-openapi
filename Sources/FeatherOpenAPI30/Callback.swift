//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct CallbackID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol CallbackRepresentable {
    func openAPICallback() -> Callback
}

public struct Callback: CallbackRepresentable {

    public func openAPICallback() -> Callback {
        fatalError()
    }
}
