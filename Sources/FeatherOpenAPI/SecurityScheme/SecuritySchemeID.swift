//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public struct SecuritySchemeID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}
