//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

public struct OperationResponse {

    public let statusCode: Int
    public let response: Response.Type

    public init(
        _ statusCode: Int,
        _ response: Response.Type
    ) {
        self.statusCode = statusCode
        self.response = response
    }
}

public extension OperationResponse {

    static func ok(_ response: Response.Type) -> Self {
        .init(200, response)
    }

    static func found(_ response: Response.Type) -> Self {
        .init(302, response)
    }

    static func seeOther(_ response: Response.Type) -> Self {
        .init(303, response)
    }

    static func temporaryRedirect(_ response: Response.Type) -> Self {
        .init(307, response)
    }

    static func badRequest(_ response: Response.Type) -> Self {
        .init(400, response)
    }

    static func unauthorized(_ response: Response.Type) -> Self {
        .init(401, response)
    }

    static func forbidden(_ response: Response.Type) -> Self {
        .init(403, response)
    }

    static func notFound(_ response: Response.Type) -> Self {
        .init(404, response)
    }

    static func methodNotAllowed(_ response: Response.Type) -> Self {
        .init(405, response)
    }

    static func notAcceptable(_ response: Response.Type) -> Self {
        .init(406, response)
    }

    static func conflict(_ response: Response.Type) -> Self {
        .init(409, response)
    }

    static func gone(_ response: Response.Type) -> Self {
        .init(410, response)
    }

    static func unsupportedMediaType(_ response: Response.Type) -> Self {
        .init(415, response)
    }

    static func unprocessableContent(_ response: Response.Type) -> Self {
        .init(422, response)
    }
}
