//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPIParameter: Identifiable {
    static func openAPIParameter() -> OpenAPI.Parameter
}

public extension OpenAPIParameter {

    static func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Parameter>,
        OpenAPI.Parameter
    > {
        .reference(.component(named: id))
    }
}

public protocol Parameter: OpenAPIParameter {
    static var name: String { get }
    static var context: OpenAPI.Parameter.Context { get }
    static var schema: Schema.Type { get }
    static var description: String { get }
    static var required: Bool { get }
}

public extension Parameter {

    static var required: Bool { true }

    static var path: Path { .parameter(name) }

    static func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: name,
            context: context,  // TODO: fix me
            //            schema: schema.reference(),
            description: description
        )
    }
}
