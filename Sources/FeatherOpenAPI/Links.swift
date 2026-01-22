//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct LinkID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol LinkRepresentable {
    func openAPILink() -> OpenAPI.Link
}

public struct Link: LinkRepresentable {

    public func openAPILink() -> OpenAPI.Link {
        fatalError()
        //        .init(
        //            operationId: <#T##String#>,
        //            parameters: <#T##OrderedDictionary<String, Either<OpenAPI.RuntimeExpression, AnyCodable>>#>,
        //            requestBody: <#T##Either<OpenAPI.RuntimeExpression, AnyCodable>?#>,
        //            description: <#T##String?#>,
        //            server: <#T##OpenAPI.Server?#>,
        //            vendorExtensions: <#T##[String : AnyCodable]#>
        //        )
    }
}
