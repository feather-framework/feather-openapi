//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import FeatherOpenAPI30

extension HeaderID {
    static var example: Self { .init(#function) }
}

extension HeaderID {
    static var customResponse: Self { .init(#function) }
}

extension Header {

    static var customResponse: Self {
        .init(
            schema: .customResponseHeader,
            description: "My custom response header",
        )
    }
}
