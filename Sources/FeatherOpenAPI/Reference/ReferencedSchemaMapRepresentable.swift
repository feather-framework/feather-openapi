//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 23..
//

import OpenAPIKit30

public protocol ReferencedSchemaMapRepresentable {
    var referencedSchemaMap: OrderedDictionary<SchemaID, OpenAPISchemaRepresentable> { get }
}


public protocol ReferencedParameterMapRepresentable {
    var referencedParameterMap: OrderedDictionary<ParameterID, OpenAPIParameterRepresentable> { get }
}

public protocol ReferencedRequestBodyMapRepresentable {
    var referencedRequestBodyMap: OrderedDictionary<RequestBodyID, OpenAPIRequestBodyRepresentable> { get }
}
