//
//  ContentTypeKey.swift
//  feather-openapi
//

/// A media type key that does not expose OpenAPIKit types to API generators.
public struct ContentTypeKey: Hashable, Sendable, ExpressibleByStringLiteral {
    public let rawValue: String

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.init(value)
    }

    public static let json = Self("application/json")
    public static let xml = Self("application/xml")
    public static let form = Self("application/x-www-form-urlencoded")
    public static let multipartForm = Self("multipart/form-data")
    public static let octetStream = Self("application/octet-stream")

    public static func other(_ rawValue: String) -> Self {
        Self(rawValue)
    }
}
