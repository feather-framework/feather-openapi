//
//  Pet+Parameters.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

import FeatherOpenAPI

extension Petstore.Pet {

    struct IdParameter: PathParameterRepresentable {
        var name: String { "petId" }
        var description: String? { "ID of pet to return" }
        var schema: any OpenAPISchemaRepresentable {
            IdSchema()
        }
    }

    struct UpdateIdParameter: PathParameterRepresentable {
        var name: String { "petId" }
        var description: String? { "ID of pet that needs to be updated" }
        var schema: any OpenAPISchemaRepresentable {
            IdSchema()
        }
    }

    struct DeleteIdParameter: PathParameterRepresentable {
        var name: String { "petId" }
        var description: String? { "Pet id to delete" }
        var schema: any OpenAPISchemaRepresentable {
            IdSchema()
        }
    }

    struct UploadIdParameter: PathParameterRepresentable {
        var name: String { "petId" }
        var description: String? { "ID of pet to update" }
        var schema: any OpenAPISchemaRepresentable {
            IdSchema()
        }
    }

    struct StatusQueryParameter: QueryParameterRepresentable {
        var name: String { "status" }
        var description: String? {
            "Status values that need to be considered for filter"
        }
        var required: Bool { true }
        var schema: any OpenAPISchemaRepresentable {
            StatusQuerySchema()
        }
    }

    struct TagsQueryParameter: QueryParameterRepresentable {
        var name: String { "tags" }
        var description: String? { "Tags to filter by" }
        var required: Bool { true }
        var schema: any OpenAPISchemaRepresentable {
            TagsQuerySchema()
        }
    }

    struct NameQueryParameter: QueryParameterRepresentable {
        var name: String { "name" }
        var description: String? { "Name of pet that needs to be updated" }
        var required: Bool { false }
        var schema: any OpenAPISchemaRepresentable {
            UpdateNameSchema()
        }
    }

    struct StatusUpdateQueryParameter: QueryParameterRepresentable {
        var name: String { "status" }
        var description: String? { "Status of pet that needs to be updated" }
        var required: Bool { false }
        var schema: any OpenAPISchemaRepresentable {
            UpdateStatusSchema()
        }
    }

    struct ApiKeyHeaderParameter: HeaderParameterRepresentable {
        var name: String { "api_key" }
        var description: String? { "" }
        var required: Bool { false }
        var schema: any OpenAPISchemaRepresentable {
            ApiKeySchema()
        }
    }

    struct AdditionalMetadataQueryParameter: QueryParameterRepresentable {
        var name: String { "additionalMetadata" }
        var description: String? { "Additional Metadata" }
        var required: Bool { false }
        var schema: any OpenAPISchemaRepresentable {
            AdditionalMetadataSchema()
        }
    }
}
