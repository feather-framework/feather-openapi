//
//  Path.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

/// A lightweight OpenAPI path wrapper with composition helpers.
public struct Path: ExpressibleByStringLiteral {

    /// The underlying path string.
    public let value: String

    /// Creates a new path from a string.
    /// - Parameter value: The path string.
    public init(_ value: String) {
        self.value = value
    }

    /// Creates a new path from a string literal.
    /// - Parameter value: The path string.
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }

    /// Joins two paths with a `/` separator.
    /// - Parameters:
    ///   - lhs: The left-hand path.
    ///   - rhs: The right-hand path.
    /// - Returns: The combined path.
    public static func / (lhs: Self, rhs: Self) -> Self {
        .init(lhs.value + "/" + rhs.value)
    }

    /// Joins a path and a string segment.
    /// - Parameters:
    ///   - lhs: The left-hand path.
    ///   - rhs: The right-hand path segment.
    /// - Returns: The combined path.
    public static func / (lhs: Self, rhs: String) -> Self {
        lhs / Self(rhs)
    }

    /// Joins a string segment and a path.
    /// - Parameters:
    ///   - lhs: The left-hand path segment.
    ///   - rhs: The right-hand path.
    /// - Returns: The combined path.
    public static func / (lhs: String, rhs: Self) -> Self {
        Self(lhs) / rhs
    }
}

extension Path {

    /// Builds a path parameter segment like `{id}`.
    /// - Parameter param: The parameter name.
    /// - Returns: The parameterized path segment.
    public static func parameter(_ param: String) -> Self {
        .init("{" + param + "}")
    }
}
