//
//  ExampleID.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

/// Strongly typed identifier for reusable OpenAPI examples.
public struct ExampleID: Sendable, Equatable, Hashable, Codable {

    /// The raw identifier value.
    public var rawValue: String

    /// Creates an example identifier.
    /// - Parameter rawValue: The raw identifier value.
    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}
