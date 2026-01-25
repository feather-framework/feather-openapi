//
//  ReferencedSchemaMapRepresentable.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

/// Exposes referenced schemas.
public protocol ReferencedSchemaMapRepresentable {
    /// Map of referenced schemas.
    var referencedSchemaMap:
        OrderedDictionary<SchemaID, OpenAPISchemaRepresentable>
    { get }
}

/// Exposes referenced parameters.
public protocol ReferencedParameterMapRepresentable {
    /// Map of referenced parameters.
    var referencedParameterMap:
        OrderedDictionary<ParameterID, OpenAPIParameterRepresentable>
    { get }
}

/// Exposes referenced request bodies.
public protocol ReferencedRequestBodyMapRepresentable {
    /// Map of referenced request bodies.
    var referencedRequestBodyMap:
        OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable>
    { get }
}

/// Exposes referenced headers.
public protocol ReferencedHeaderMapRepresentable {
    /// Map of referenced headers.
    var referencedHeaderMap:
        OrderedDictionary<HeaderID, OpenAPIHeaderRepresentable>
    { get }
}

/// Exposes referenced responses.
public protocol ReferencedResponseMapRepresentable {
    /// Map of referenced responses.
    var referencedResponseMap:
        OrderedDictionary<ResponseID, OpenAPIResponseRepresentable>
    { get }
}

/// Exposes referenced security requirements.
public protocol ReferencedSecuritySchemeMapRepresentable {
    /// List of referenced security requirements.
    var referencedSecurityRequirements: [SecurityRequirementRepresentable] {
        get
    }
}

/// Exposes referenced tags.
public protocol ReferencedTagMapRepresentable {
    /// List of referenced tags.
    var referencedTags: [OpenAPITagRepresentable] { get }
}
