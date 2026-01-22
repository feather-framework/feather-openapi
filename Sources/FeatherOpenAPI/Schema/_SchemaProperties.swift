//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import OpenAPIKit30

// MARK: - required

public protocol SchemaPropertyRequired {
    var required: Bool { get }
}

public extension SchemaPropertyRequired {
    var required: Bool { true }
}

// MARK: - description

public protocol SchemaPropertyDescription {
    var description: String? { get }
}

public extension SchemaPropertyDescription {
    var description: String? { nil }
}

// MARK: - title

public protocol SchemaPropertyTitle {
    var title: String? { get }
}

public extension SchemaPropertyTitle {
    var title: String? { nil }
}

// MARK: - deprecated

public protocol SchemaPropertyDeprecated {
    var deprecated: Bool? { get }
}

public extension SchemaPropertyDeprecated {
    var deprecated: Bool? { nil }
}

// MARK: - nullable

public protocol SchemaPropertyNullable {
    var nullable: Bool? { get }
}

public extension SchemaPropertyNullable {
    var nullable: Bool? { nil }
}


// MARK: - example

public protocol SchemaPropertyExample {
    associatedtype ExamplePropertyType = AnyCodable
    
    var example: ExamplePropertyType? { get }
}

public extension SchemaPropertyExample {
    var example: ExamplePropertyType? { nil }
}

// MARK: - defaultValue

public protocol SchemaPropertyDefaultValue {
    associatedtype DefaultValuePropertyType = AnyCodable
    
    var defaultValue: DefaultValuePropertyType? { get }
}

public extension SchemaPropertyDefaultValue {
    var defaultValue: DefaultValuePropertyType? { nil }
}


// MARK: - allowedValues

public protocol SchemaPropertyAllowedValues {
    associatedtype AllowedValuesPropertyType = AnyCodable
    
    var allowedValues: [AllowedValuesPropertyType]? { get }
}

public extension SchemaPropertyAllowedValues {
    var allowedValues: [AllowedValuesPropertyType]? { nil }
}
