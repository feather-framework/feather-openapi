//
//  ResponseID.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

/// Strongly typed identifier for reusable OpenAPI responses.
public struct ResponseID: Sendable, Equatable, Hashable, Codable {

    /// The raw identifier value.
    public var rawValue: String

    /// Creates a response identifier.
    /// - Parameter rawValue: The raw identifier value.
    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}
