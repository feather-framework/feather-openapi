import OpenAPIKit30
import Testing
import Yams

@testable import FeatherOpenAPI

@Suite
struct SchemaSerializationTestSuite {

    @Test
    func omittedStringDefaultAndExampleDoNotSerializeAsNull() throws {
        let schema = OmittedStringSchema()
        let openAPI = schema.openAPISchema()
        let yaml = try YAMLEncoder().encode(openAPI)

        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedIntDefaultAndExampleDoNotSerializeAsNull() throws {
        let schema = OmittedIntSchema()
        let openAPI = schema.openAPISchema()
        let yaml = try YAMLEncoder().encode(openAPI)

        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func explicitDefaultAndExampleStillSerialize() throws {
        let schema = ExplicitStringSchema()
        let openAPI = schema.openAPISchema()
        let yaml = try YAMLEncoder().encode(openAPI)

        #expect(yaml.contains("default: abc"))
        #expect(yaml.contains("example: xyz"))
    }
}

private struct OmittedStringSchema: StringSchemaRepresentable {}
private struct OmittedIntSchema: IntSchemaRepresentable {}

private struct ExplicitStringSchema: StringSchemaRepresentable {
    var defaultValue: String? { "abc" }
    var example: String? { "xyz" }
}
