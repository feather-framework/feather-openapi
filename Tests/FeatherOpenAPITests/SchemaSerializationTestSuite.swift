import OpenAPIKit30
import Testing
import Yams

@testable import FeatherOpenAPI

@Suite
struct SchemaSerializationTestSuite {

    @Test
    func omittedStringDefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedStringSchema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedIntDefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedIntSchema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedInt32DefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedInt32Schema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedInt64DefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedInt64Schema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedFloatDefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedFloatSchema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedDoubleDefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedDoubleSchema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func omittedBoolDefaultAndExampleDoNotSerializeAsNull() throws {
        let yaml = try YAMLEncoder().encode(OmittedBoolSchema().openAPISchema())
        #expect(yaml.contains("default: null") == false)
        #expect(yaml.contains("example: null") == false)
    }

    @Test
    func explicitDefaultAndExampleStillSerialize() throws {
        let yaml = try YAMLEncoder().encode(ExplicitStringSchema().openAPISchema())
        #expect(yaml.contains("default: abc"))
        #expect(yaml.contains("example: xyz"))
    }
}

private struct OmittedStringSchema: StringSchemaRepresentable {}
private struct OmittedIntSchema: IntSchemaRepresentable {}
private struct OmittedInt32Schema: Int32SchemaRepresentable {}
private struct OmittedInt64Schema: Int64SchemaRepresentable {}
private struct OmittedFloatSchema: FloatSchemaRepresentable {}
private struct OmittedDoubleSchema: DoubleSchemaRepresentable {}
private struct OmittedBoolSchema: BoolSchemaRepresentable {}

private struct ExplicitStringSchema: StringSchemaRepresentable {
    var defaultValue: String? { "abc" }
    var example: String? { "xyz" }
}
