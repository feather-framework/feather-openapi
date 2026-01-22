//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit30

public protocol OpenAPIHeader: Identifiable {
    static func openAPIHeader() -> OpenAPI.Header
}

public protocol Header: OpenAPIHeader {
    static var name: String { get }
    static var description: String { get }
    static var schema: Schema.Type { get }
}

public extension Header {

    //    static func reference() -> Either<
    //        OpenAPI.Reference<OpenAPI.Header>, OpenAPI.Header
    //    > {
    //        .reference(.component(named: id))
    //    }
}

public extension Header {

    static var id: String { name }

    static func openAPIHeader() -> OpenAPI.Header {
        .init(
            schema: schema.reference(),
            description: description
        )
    }
}
