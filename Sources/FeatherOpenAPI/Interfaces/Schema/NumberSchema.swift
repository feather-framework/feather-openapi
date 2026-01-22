public protocol NumberSchema: Schema {
    associatedtype T

    static var defaultValue: T? { get }
    static var example: T? { get }

    static var minimumValue: T? { get }
    static var minimumExclusive: Bool { get }
    static var minimum: (T, exclusive: Bool)? { get }

    static var maximumValue: T? { get }
    static var maximumExclusive: Bool { get }
    static var maximum: (T, exclusive: Bool)? { get }
}

extension NumberSchema {

    public static var minimumValue: T? { nil }
    public static var minimumExclusive: Bool { false }
    public static var minimum: (T, exclusive: Bool)? {
        if let value = minimumValue {
            return (value, exclusive: minimumExclusive)
        }
        return nil
    }
    public static var maximumValue: T? { nil }
    public static var maximumExclusive: Bool { false }
    public static var maximum: (T, exclusive: Bool)? {
        if let value = maximumValue {
            return (value, exclusive: maximumExclusive)
        }
        return nil
    }

    public static var defaultValue: T? { nil }
    public static var example: T? { nil }
}
