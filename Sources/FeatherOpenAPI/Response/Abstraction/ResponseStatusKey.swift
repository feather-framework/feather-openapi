//
//  ResponseStatusKey.swift
//  feather-openapi
//

/// A response status code or range, independent of OpenAPIKit.
public enum ResponseStatusKey: Hashable, Sendable,
    ExpressibleByIntegerLiteral
{
    case status(Int)
    case `default`
    case range(Range)

    public enum Range: String, Hashable, Sendable {
        case information = "1XX"
        case success = "2XX"
        case redirect = "3XX"
        case clientError = "4XX"
        case serverError = "5XX"
    }

    public init(integerLiteral value: Int) {
        self = .status(value)
    }
}
