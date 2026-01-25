//
//  HeaderID.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

/// Strongly typed identifier for reusable OpenAPI headers.
public struct HeaderID: Sendable, Equatable, Hashable, Codable {

    /// The raw identifier value.
    public var rawValue: String

    /// Creates a header identifier.
    /// - Parameter rawValue: The raw identifier value.
    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}
