//
//  TitleProperty.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public protocol TitleProperty {
    /// Short title.
    var title: String? { get }
}

extension TitleProperty {
    /// Default title is `nil`.
    public var title: String? { nil }
}
