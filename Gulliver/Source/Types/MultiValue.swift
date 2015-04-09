import AddressBook

public typealias MultiValueIdentifier = ABMultiValueIdentifier

public let MultiValueIdentifierInvalid: MultiValueIdentifier = kABMultiValueInvalidIdentifier

public class MultiValue<T: MultiValueRepresentable> {
    public var count: Int {
        return values.count
    }

    public private(set) var values: [LabeledValue<T>] = []

    public func multiValueRef() -> ABMutableMultiValueRef {
        var result: ABMutableMultiValueRef = ABMultiValueCreateMutable(T.multiValueType.rawValue)!.takeRetainedValue()
        for value in values {
            var identifier: MultiValueIdentifier = MultiValueIdentifierInvalid
            ABMultiValueAddValueAndLabel(result, value.value.multiValueRepresentation, value.label, &identifier)
        }
        return result
    }

    public init() {
        
    }

    public convenience init(multiValue: ABMultiValueRef) {
        assert(ABMultiValueGetPropertyType(multiValue) == T.multiValueType.rawValue, "ABMultiValueRef argument has incompatible property type")
        self.init()

        let count: Int = ABMultiValueGetCount(multiValue)
        for i in 0..<count {
            let label = ABMultiValueCopyLabelAtIndex(multiValue, i)!.takeRetainedValue() as String

            let dictionaryRepresenation: CFTypeRef = ABMultiValueCopyValueAtIndex(multiValue, i)!.takeRetainedValue()
            let value = T(multiValueRepresentation: dictionaryRepresenation)!

            self.values.append(LabeledValue(label: label, value: value))
        }
    }

    public func add(label: String, value: T) {
        values.append(LabeledValue(label: label, value: value))
    }

    public func insert(index: Int, label: String, value: T) {
        values.insert(LabeledValue(label: label, value: value), atIndex: index)
    }

    public func remove(index: Int) {
        values.removeAtIndex(index)
    }

    public func replace(index: Int, label: String, value: T) {
        values[index] = LabeledValue(label: label, value: value)
    }

    public func replace(index: Int, value: T) {
        values[index].value = value
    }

    public func replace(index: Int, label: String) {
        values[index].label = label
    }

}

public struct MultiValueGenerator<T: MultiValueRepresentable>: GeneratorType {

    private typealias SubGeneratorType = IndexingGenerator<[LabeledValue<T>]>
    private var generator: SubGeneratorType

    private init(_ generator: SubGeneratorType) {
        self.generator = generator
    }

    public mutating func next() -> LabeledValue<T>? {
        return generator.next()
    }

}

extension MultiValue: SequenceType {

    public func generate() -> MultiValueGenerator<T> {
        return MultiValueGenerator<T>(values.generate())
   }

}