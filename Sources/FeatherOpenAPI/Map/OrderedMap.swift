//
//  OrderedMap.swift
//  feather-openapi
//

import OpenAPIKit30

/// An insertion-ordered map used by FeatherOpenAPI's public abstractions.
public struct OrderedMap<Key: Hashable, Value>:
    ExpressibleByDictionaryLiteral,
    Sequence
{
    private var storage: OrderedDictionary<Key, Value>

    var orderedDictionary: OrderedDictionary<Key, Value> { storage }

    public init(dictionaryLiteral elements: (Key, Value)...) {
        self.storage = [:]
        for (key, value) in elements {
            self.storage[key] = value
        }
    }

    public init() {
        self.storage = [:]
    }

    public var keys: [Key] { Array(storage.keys) }
    public var values: [Value] { Array(storage.values) }
    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { storage.count }

    public subscript(key: Key) -> Value? {
        get { storage[key] }
        set { storage[key] = newValue }
    }

    public mutating func merge(
        _ other: Self,
        uniquingKeysWith combine: (Value, Value) throws -> Value
    ) rethrows {
        try storage.merge(other.storage, uniquingKeysWith: combine)
    }

    public func mapValues<Transformed>(
        _ transform: (Value) throws -> Transformed
    ) rethrows -> OrderedMap<Key, Transformed> {
        var result = OrderedMap<Key, Transformed>()
        for (key, value) in storage {
            result[key] = try transform(value)
        }
        return result
    }

    public struct Iterator: IteratorProtocol {
        private var iterator: IndexingIterator<[(Key, Value)]>

        fileprivate init(_ elements: [(Key, Value)]) {
            self.iterator = elements.makeIterator()
        }

        public mutating func next() -> (Key, Value)? {
            iterator.next()
        }
    }

    public func makeIterator() -> Iterator {
        Iterator(storage.map { ($0.key, $0.value) })
    }
}

extension OrderedMap: Sendable where Key: Sendable, Value: Sendable {}
