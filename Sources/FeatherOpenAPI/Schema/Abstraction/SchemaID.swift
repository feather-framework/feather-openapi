//
//  SchemaID.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

public struct SchemaID: Sendable, Equatable, Hashable, Codable {

    /// The raw identifier value.
    public var rawValue: String

    /// Creates a schema identifier.
    /// - Parameter rawValue: The raw identifier value.
    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}
