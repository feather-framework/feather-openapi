//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

public struct Path: ExpressibleByStringLiteral {

    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }

    public static func / (lhs: Self, rhs: Self) -> Self {
        .init(lhs.value + "/" + rhs.value)
    }

    public static func / (lhs: Self, rhs: String) -> Self {
        lhs / Self(rhs)
    }

    public static func / (lhs: String, rhs: Self) -> Self {
        Self(lhs) / rhs
    }
}

public extension Path {

    static func parameter(_ param: String) -> Self {
        .init("{" + param + "}")
    }
}
