//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

public protocol TitleProperty {
    var title: String? { get }
}

public extension TitleProperty {
    var title: String? { nil }
}
