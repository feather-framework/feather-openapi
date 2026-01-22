//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit30

public protocol OpenAPIOperation: Identifiable {
    static func openAPIOperation() -> OpenAPI.Operation
}

public protocol Operation: OpenAPIOperation {
    static var operationId: String { get }
    static var tag: Tag.Type { get }
    static var summary: String { get }
    static var description: String { get }

    static var parameters: [Parameter.Type] { get }
    static var requestBody: RequestBody.Type? { get }
    static var responses: [OperationResponse] { get }
    static var security: [SecurityScheme.Type] { get }
}

public extension Operation {

    static var operationId: String {
        var components = String(reflecting: self)
            .split(separator: ".")
            .dropFirst()
            .map(String.init)

        components.remove(at: 2)
        if let last = components.popLast()?.lowercasedFirstLetter() {
            components.insert(last, at: 0)
        }
        return components.joined(separator: "")
    }

    static var parameters: [Parameter.Type] { [] }
    static var requestBody: RequestBody.Type? { nil }
    static var security: [SecurityScheme.Type] { [] }

    static func openAPIOperation() -> OpenAPI.Operation {
        .init(
            tags: tag.name,
            summary: summary,
            description: description,
            operationId: operationId,
            parameters: parameters.map { .reference(.component(named: $0.id)) },
            requestBody: requestBody?.openAPIRequestBody(),
            responses: responses.reduce(into: [:]) {
                $0[.init(integerLiteral: $1.statusCode)] = .reference(
                    .component(named: $1.response.id)
                )
            },
            security: security.map { [$0.reference(): []] }
        )
    }
}
