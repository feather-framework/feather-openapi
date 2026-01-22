//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol PathItemRepresentable {
    func openAPIPathItem() -> OpenAPI.PathItem
}

public struct PathItem: PathItemRepresentable {

    public var summary: String?
    public var description: String?
    public var servers: [ServerRepresentable]?
    public var get: OperationRepresentable?
    public var put: OperationRepresentable?
    public var post: OperationRepresentable?
    public var delete: OperationRepresentable?
    public var options: OperationRepresentable?
    public var head: OperationRepresentable?
    public var patch: OperationRepresentable?
    public var trace: OperationRepresentable?
    public var vendorExtensions: [String: AnyCodable]

    public init(
        summary: String? = nil,
        description: String? = nil,
        servers: [ServerRepresentable]? = nil,
        get: OperationRepresentable? = nil,
        put: OperationRepresentable? = nil,
        post: OperationRepresentable? = nil,
        delete: OperationRepresentable? = nil,
        options: OperationRepresentable? = nil,
        head: OperationRepresentable? = nil,
        patch: OperationRepresentable? = nil,
        trace: OperationRepresentable? = nil,
        vendorExtensions: [String: AnyCodable] = [:]
    ) {
        self.summary = summary
        self.description = description
        self.servers = servers
        self.get = get
        self.put = put
        self.post = post
        self.delete = delete
        self.options = options
        self.head = head
        self.patch = patch
        self.trace = trace
        self.vendorExtensions = vendorExtensions
    }

    public func openAPIPathItem() -> OpenAPI.PathItem {
        .init(
            summary: summary,
            description: description,
            servers: servers?.map { $0.openAPIServer() },
            parameters: [],
            get: get?.openAPIOperation(),
            put: put?.openAPIOperation(),
            post: post?.openAPIOperation(),
            delete: delete?.openAPIOperation(),
            options: options?.openAPIOperation(),
            head: head?.openAPIOperation(),
            patch: patch?.openAPIOperation(),
            trace: trace?.openAPIOperation(),
            vendorExtensions: vendorExtensions
        )
    }
}
