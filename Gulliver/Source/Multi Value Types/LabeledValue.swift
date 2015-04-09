public struct LabeledValue<T>: DebugPrintable, Printable {
    var label: String
    var value: T

    public init(label: String, value: T) {
        self.label = label
        self.value = value
    }

    public var description: String {
        return "\(label): \(toString(value))"
    }

    public var debugDescription: String {
        return "\(label): \(toDebugString(value))"
    }
}
