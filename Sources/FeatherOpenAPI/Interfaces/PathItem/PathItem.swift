//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPIPathItem: Identifiable {
    static var openAPIPath: OpenAPI.Path { get }
    static func openAPIPathItem() -> OpenAPI.PathItem
}

public protocol PathItem: OpenAPIPathItem {

    static var path: Path { get }

    static var summary: String? { get }
    static var description: String? { get }
    static var parameters: [Parameter.Type] { get }
    static var get: Operation.Type? { get }
    static var put: Operation.Type? { get }
    static var post: Operation.Type? { get }
    static var delete: Operation.Type? { get }
    static var options: Operation.Type? { get }
    static var head: Operation.Type? { get }
    static var patch: Operation.Type? { get }
    static var trace: Operation.Type? { get }
}

public extension PathItem {

    static var openAPIPath: OpenAPI.Path {
        .init(stringLiteral: path.value)
    }

    static var summary: String? { nil }
    static var description: String? { nil }
    static var parameters: [Parameter.Type] { [] }
    static var get: Operation.Type? { nil }
    static var put: Operation.Type? { nil }
    static var post: Operation.Type? { nil }
    static var delete: Operation.Type? { nil }
    static var options: Operation.Type? { nil }
    static var head: Operation.Type? { nil }
    static var patch: Operation.Type? { nil }
    static var trace: Operation.Type? { nil }

    static func openAPIPathItem() -> OpenAPI.PathItem {
        .init(
            summary: summary,
            description: description,
            servers: nil,
            parameters: parameters.map { $0.reference() },
            get: get?.openAPIOperation(),
            put: put?.openAPIOperation(),
            post: post?.openAPIOperation(),
            delete: delete?.openAPIOperation(),
            options: options?.openAPIOperation(),
            head: head?.openAPIOperation(),
            patch: patch?.openAPIOperation(),
            trace: trace?.openAPIOperation(),
            vendorExtensions: [:]
        )
    }
}
