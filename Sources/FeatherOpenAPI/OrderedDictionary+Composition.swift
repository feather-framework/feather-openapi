//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit30

extension OrderedDictionary {
    
    mutating func merge(_ other: Self) {
        merge(other, uniquingKeysWith: { _, new in new })
    }
}
