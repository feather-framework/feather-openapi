//
//  OrderedDictionary+Merge.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 25..

import OpenAPIKit30

extension OrderedDictionary {

    mutating func merge(_ other: Self) {
        merge(other, uniquingKeysWith: { _, new in new })
    }
}
