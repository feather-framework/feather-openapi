import Yams

/// Encodes OpenAPI values to YAML and applies configurable post-processing transforms.
public enum OpenAPIYAMLSerializer {

    /// Options controlling serializer transforms.
    public struct Options {
        /// Enables the built-in transform that quotes status-code-like keys under `responses` mappings.
        public var quoteResponseStatusCodeKeys: Bool

        /// Creates serializer options.
        /// - Parameter quoteResponseStatusCodeKeys: Enables response status code key quoting.
        public init(quoteResponseStatusCodeKeys: Bool = true) {
            self.quoteResponseStatusCodeKeys = quoteResponseStatusCodeKeys
        }
    }

    /// Encodes a value to YAML and applies enabled serializer transforms.
    /// - Parameters:
    ///   - value: The value to encode.
    ///   - encoder: The YAML encoder used for base encoding and emitter options.
    ///   - options: Serializer options controlling post-processing.
    /// - Returns: A transformed YAML string.
    public static func encode<Value: Encodable>(
        _ value: Value,
        using encoder: YAMLEncoder = .init(),
        options: Options = .init()
    ) throws -> String {
        let yaml = try encoder.encode(value)
        guard let root = try compose(yaml: yaml) else {
            return yaml
        }

        let transformed = apply(options: options, to: root)
        return try encoder.serialize(node: transformed)
    }

    private static func apply(options: Options, to node: Node) -> Node {
        var result = node
        if options.quoteResponseStatusCodeKeys {
            result = result.quotingResponseStatusCodeKeys()
        }
        return result
    }
}

private extension Node {

    func quotingResponseStatusCodeKeys() -> Node {
        switch self {
        case .mapping(var mapping):
            for index in mapping.indices {
                var pair = mapping[index]

                if pair.key.string == "responses", case .mapping(var responsesMapping) = pair.value {
                    for responseIndex in responsesMapping.indices {
                        var responsePair = responsesMapping[responseIndex]

                        if var scalarKey = responsePair.key.scalar,
                           scalarKey.string.isResponseStatusCodeLike
                        {
                            scalarKey.style = .doubleQuoted
                            responsePair.key = .scalar(scalarKey)
                        }

                        responsePair.value = responsePair.value.quotingResponseStatusCodeKeys()
                        responsesMapping[responseIndex] = responsePair
                    }

                    pair.value = .mapping(responsesMapping)
                } else {
                    pair.value = pair.value.quotingResponseStatusCodeKeys()
                }

                mapping[index] = pair
            }
            return .mapping(mapping)

        case .sequence(var sequence):
            for index in sequence.indices {
                sequence[index] = sequence[index].quotingResponseStatusCodeKeys()
            }
            return .sequence(sequence)

        case .scalar, .alias:
            return self
        }
    }
}

private extension String {

    var isResponseStatusCodeLike: Bool {
        count == 3 && allSatisfy { $0.isNumber || $0 == "X" || $0 == "x" }
    }
}

private extension YAMLEncoder {

    func serialize(node: Node) throws -> String {
        try Yams.serialize(
            node: node,
            canonical: options.canonical,
            indent: options.indent,
            width: options.width,
            allowUnicode: options.allowUnicode,
            lineBreak: options.lineBreak,
            explicitStart: options.explicitStart,
            explicitEnd: options.explicitEnd,
            version: options.version,
            sortKeys: options.sortKeys,
            sequenceStyle: options.sequenceStyle,
            mappingStyle: options.mappingStyle,
            newLineScalarStyle: options.newLineScalarStyle,
            redundancyAliasingStrategy: options.redundancyAliasingStrategy
        )
    }
}
