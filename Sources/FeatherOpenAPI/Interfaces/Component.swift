//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

public protocol Component {

    // NOTE: no support for examples yet in OpeAPIKit
    // static var examples: [Example.Type] { get }
    static var schemas: [Schema.Type] { get }

    static var parameters: [Parameter.Type] { get }
    static var headers: [Header.Type] { get }
    static var requestBodies: [RequestBody.Type] { get }
    static var securitySchemes: [SecurityScheme.Type] { get }

    static var responses: [Response.Type] { get }

    static var tags: [Tag.Type] { get }
    static var operations: [Operation.Type] { get }
    static var pathItems: [PathItem.Type] { get }

    static func getComponentsOfType<T>() -> [T]
    static func getComponentsOfType<T>(_: T.Type) -> [T]
}

public extension Component {
    static var schemas: [Schema.Type] { getComponentsOfType() }
    static var parameters: [Parameter.Type] { getComponentsOfType() }
    static var headers: [Header.Type] { getComponentsOfType() }
    static var requestBodies: [RequestBody.Type] { getComponentsOfType() }
    static var securitySchemes: [SecurityScheme.Type] { getComponentsOfType() }
    static var responses: [Response.Type] { getComponentsOfType() }
    static var tags: [Tag.Type] { getComponentsOfType() }
    static var operations: [Operation.Type] { getComponentsOfType() }
    static var pathItems: [PathItem.Type] { getComponentsOfType() }

    static func getComponentsOfType<T>(_: T.Type) -> [T] {
        getComponentsOfType()
    }
}
