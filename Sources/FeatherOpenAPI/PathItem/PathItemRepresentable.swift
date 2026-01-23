//
//  File 2.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public protocol PathItemRepresentable:
    OpenAPIPathItemRepresentable,
    // properties
    DescriptionProperty,
    VendorExtensionsProperty,
    // reference
    ReferencedSchemaMapRepresentable,
    ReferencedParameterMapRepresentable,
    ReferencedRequestBodyMapRepresentable,
    ReferencedHeaderMapRepresentable
{
    var summary: String? { get }
    
    var servers: [OpenAPIServerRepresentable]? { get }
    var get: OperationRepresentable? { get }
    var put: OperationRepresentable? { get }
    var post: OperationRepresentable? { get }
    var delete: OperationRepresentable? { get }
    var options: OperationRepresentable? { get }
    var head: OperationRepresentable? { get }
    var patch: OperationRepresentable? { get }
    var trace: OperationRepresentable? { get }
}

public extension PathItemRepresentable {

    var summary: String? { nil }
    
    var servers: [OpenAPIServerRepresentable]? { nil }
    var get: OperationRepresentable? { nil }
    var put: OperationRepresentable? { nil }
    var post: OperationRepresentable? { nil }
    var delete: OperationRepresentable? { nil }
    var options: OperationRepresentable? { nil }
    var head: OperationRepresentable? { nil }
    var patch: OperationRepresentable? { nil }
    var trace: OperationRepresentable? { nil }
    
    func openAPIPathItem() -> OpenAPI.PathItem {
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
    
    var allOperations: [OperationRepresentable] {
        [
            get,
            put,
            post,
            delete,
            options,
            head,
            patch,
            trace,
        ]
        .compactMap { $0 }
    }
    
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()
        
        let maps = allOperations.map { $0.referencedSchemaMap }.flatMap { $0 }
        
        for (k, v) in maps {
            results[k] = v
        }
        return results
    }
    
    var referencedParameterMap: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable> {
        var results = OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>()
        
        let maps = allOperations.map { $0.referencedParameterMap }.flatMap { $0 }
        
        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    var referencedRequestBodyMap: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable> {
        var results = OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>()

        let maps = allOperations.map { $0.referencedRequestBodyMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }

    var referencedHeaderMap: OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable> {
        var results = OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>()

        let maps = allOperations.map { $0.referencedHeaderMap }.flatMap { $0 }

        for (k, v) in maps {
            results[k] = v
        }
        return results
    }
}
