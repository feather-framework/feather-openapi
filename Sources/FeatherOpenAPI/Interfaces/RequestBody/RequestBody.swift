//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPIRequestBody: Identifiable {
    static func openAPIRequestBody() -> OpenAPI.Request
}

public protocol RequestBody: OpenAPIRequestBody {

}

extension RequestBody {}
