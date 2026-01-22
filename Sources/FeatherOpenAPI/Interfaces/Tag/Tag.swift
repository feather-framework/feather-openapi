//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit30

public protocol OpenAPITag: Identifiable {
    static func openAPITag() -> OpenAPI.Tag
}

public protocol Tag: OpenAPITag {
    static var name: String { get }
    static var description: String { get }
}

public extension Tag {

    static var name: String { id }
    static var description: String { "" }

    static func openAPITag() -> OpenAPI.Tag {
        .init(name: name, description: description)
    }
}
