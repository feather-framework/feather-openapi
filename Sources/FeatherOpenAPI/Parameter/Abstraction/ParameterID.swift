//
//  ParameterID.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

/// Strongly typed identifier for reusable OpenAPI parameters.
public struct ParameterID: Sendable, Equatable, Hashable, Codable {

    /// The raw identifier value.
    public var rawValue: String

    /// Creates a parameter identifier.
    /// - Parameter rawValue: The raw identifier value.
    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}
