//
//  PathCollectionRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Describes a collection of paths and their derived components.
public protocol PathCollectionRepresentable:
    ReferencedSchemaMapRepresentable,
    ReferencedParameterMapRepresentable,
    ReferencedRequestBodyMapRepresentable,
    ReferencedHeaderMapRepresentable,
    ReferencedResponseMapRepresentable,
    ReferencedTagMapRepresentable,
    ReferencedSecuritySchemeMapRepresentable
{
    /// The map of paths to path items.
    var pathMap: PathMap { get }
    /// Derived components from the path collection.
    var components: FeatherOpenAPI.Components { get }
}

extension PathCollectionRepresentable {

    /// Aggregated referenced schemas from the path map.
    public var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    {
        var results = OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>()

        let schemaMaps = pathMap.values
            .map { $0.referencedSchemaMap }
            .flatMap { $0 }

        for (k, v) in schemaMaps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced parameters from the path map.
    public var referencedParameterMap:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    {
        var results = OrderedDictionary<
            ParameterID, OpenAPIParameterRepresentable
        >()

        let parameterMaps = pathMap.values
            .map { $0.referencedParameterMap }
            .flatMap { $0 }

        for (k, v) in parameterMaps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced request bodies from the path map.
    public var referencedRequestBodyMap:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    {
        var results = OrderedDictionary<
            RequestBodyID, OpenAPIRequestBodyRepresentable
        >()

        let requestBodyMaps = pathMap.values
            .map { $0.referencedRequestBodyMap }
            .flatMap { $0 }

        for (k, v) in requestBodyMaps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced headers from the path map.
    public var referencedHeaderMap:
        OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    {
        var results = OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>()

        let headerMaps = pathMap.values
            .map { $0.referencedHeaderMap }
            .flatMap { $0 }

        for (k, v) in headerMaps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced responses from the path map.
    public var referencedResponseMap:
        OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    {
        var results = OrderedDictionary<
            ResponseID, OpenAPIResponseRepresentable
        >()

        let responseMaps = pathMap.values
            .map { $0.referencedResponseMap }
            .flatMap { $0 }

        for (k, v) in responseMaps {
            results[k] = v
        }
        return results
    }

    /// Aggregated referenced tags from the path map.
    public var referencedTags: [OpenAPITagRepresentable] {
        pathMap.values.map { $0.referencedTags }.flatMap { $0 }
    }

    /// Aggregated referenced security requirements from the path map.
    public var referencedSecurityRequirements:
        [SecurityRequirementRepresentable]
    {
        pathMap.values.map { $0.referencedSecurityRequirements }.flatMap { $0 }
    }

    /// Builds components from all referenced objects in the path map.
    public var components: FeatherOpenAPI.Components {
        .init(
            schemas: referencedSchemaMap,
            parameters: referencedParameterMap,
            responses: referencedResponseMap,
            requestBodies: referencedRequestBodyMap,
            headers: referencedHeaderMap,
            securityRequirements: referencedSecurityRequirements
        )
    }
}
