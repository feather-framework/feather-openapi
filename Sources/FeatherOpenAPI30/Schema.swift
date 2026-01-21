//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 21..
//

import OpenAPIKit30

public struct SchemaID: Hashable {

    public var rawValue: String

    public init(
        _ rawValue: String
    ) {
        self.rawValue = rawValue
    }
}

public protocol SchemaRepresentable {

    func openAPISchema() -> JSONSchema
}

public struct StringSchema: SchemaRepresentable {

    public var format: JSONTypeFormat.StringFormat
    public var required: Bool
    public var nullable: Bool?
    //    public var permissions: Permissions?
    public var deprecated: Bool?
    public var title: String?
    public var description: String?
    public var discriminator: OpenAPI.Discriminator?
    public var externalDocs: OpenAPI.ExternalDocumentation?
    public var minLength: Int?
    public var maxLength: Int?
    public var pattern: String?
    public var allowedValues: [AnyCodable]?
    public var defaultValue: AnyCodable?
    public var example: AnyCodable?

    public init(
        format: JSONTypeFormat.StringFormat = .generic,
        required: Bool = false,
        nullable: Bool? = nil,
        //        permissions: Permissions? = nil,
        deprecated: Bool? = nil,
        title: String? = nil,
        description: String? = nil,
        discriminator: OpenAPI.Discriminator? = nil,
        externalDocs: OpenAPI.ExternalDocumentation? = nil,
        minLength: Int? = nil,
        maxLength: Int? = nil,
        pattern: String? = nil,
        allowedValues: [AnyCodable]? = nil,
        defaultValue: AnyCodable? = nil,
        example: AnyCodable? = nil
    ) {
        self.format = format
        self.required = required
        self.nullable = nullable
        //        self.permissions = permissions
        self.deprecated = deprecated
        self.title = title
        self.description = description
        self.discriminator = discriminator
        self.externalDocs = externalDocs
        self.minLength = minLength
        self.maxLength = maxLength
        self.pattern = pattern
        self.allowedValues = allowedValues
        self.defaultValue = defaultValue
        self.example = example
    }

    public func openAPISchema() -> JSONSchema {
        .string(
            format: format,
            required: required,
            nullable: nullable,
            permissions: nil,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: discriminator,
            externalDocs: externalDocs,
            minLength: minLength,
            maxLength: maxLength,
            pattern: pattern,
            allowedValues: allowedValues,
            defaultValue: defaultValue,
            example: example
        )
    }
}
