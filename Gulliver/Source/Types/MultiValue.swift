import AddressBook

public typealias MultiValueIdentifier = ABMultiValueIdentifier

public let MultiValueIdentifierInvalid: MultiValueIdentifier = kABMultiValueInvalidIdentifier

public struct MultiValue<T: MultiValueRepresentable>: ArrayLiteralConvertible, MutableSliceable, RangeReplaceableCollectionType {
    typealias Element = (String, T)

    private var values = [Element]()

    public var array: [Element] {
        return values
    }
    
    public var startIndex: Int {
        return values.startIndex
    }

    public var endIndex: Int {
        return values.endIndex
    }

    public var isEmpty: Bool {
        return values.isEmpty
    }

    public var count: Int {
        return values.count
    }

    public func multiValueRef() -> ABMutableMultiValueRef {
        var result: ABMutableMultiValueRef = ABMultiValueCreateMutable(T.multiValueType.rawValue)!.takeRetainedValue()
        for (label, value) in values {
            var identifier: MultiValueIdentifier = MultiValueIdentifierInvalid
            ABMultiValueAddValueAndLabel(result, value.multiValueRepresentation, label, &identifier)
        }
        return result
    }

    public init() {
        
    }

    public init(multiValue: ABMultiValueRef) {
        assert(ABMultiValueGetPropertyType(multiValue) == T.multiValueType.rawValue, "ABMultiValueRef argument has incompatible property type")
        self.init()

        let count: Int = ABMultiValueGetCount(multiValue)
        for i in 0..<count {
            let label = ABMultiValueCopyLabelAtIndex(multiValue, i)!.takeRetainedValue() as String

            let dictionaryRepresenation: CFTypeRef = ABMultiValueCopyValueAtIndex(multiValue, i)!.takeRetainedValue()
            let value = T(multiValueRepresentation: dictionaryRepresenation)!

            values.append((label, value))
        }
    }

    // MARK: ArrayLiteralConvertible

    public init(arrayLiteral elements: Element...) {
        values.extend(elements)
    }

    // MARK: SequenceType

    public func generate() -> GeneratorOf<Element> {
        return GeneratorOf(values.generate())
    }

    // MARK: Sliceable / MutableSliceable

    public subscript (bounds: Range<Int>) -> ArraySlice<Element> {
        get {
            return values[bounds]
        }
        set {
            values[bounds] = newValue
        }
    }

    // MARK: CollectionType / MutableCollectionType

    public subscript (position: Int) -> Element {
        get {
            return values[position]
        }
        set {
            values[position] = newValue
        }
    }

    // MARK: ExtensibleCollectionType

    public mutating func reserveCapacity(n: Int) {
        values.reserveCapacity(n)
    }

    public mutating func append(x: Element) {
        values.append(x)
    }

    public mutating func extend<S: SequenceType where S.Generator.Element == Element>(newElements: S) {
        values.extend(newElements)
    }

    // MARK: RangeReplaceableCollectionType

    public mutating func replaceRange<C: CollectionType where C.Generator.Element == Element>(subRange: Range<Int>, with newElements: C) {
        values.replaceRange(subRange, with: newElements)
    }

    public mutating func insert(newElement: Element, atIndex i: Int) {
        values.insert(newElement, atIndex: i)
    }

    public mutating func splice<S: CollectionType where S.Generator.Element == Element>(newElements: S, atIndex i: Int) {
        values.splice(newElements, atIndex: i)
    }

    public mutating func removeAtIndex(i: Int) -> Element {
        return values.removeAtIndex(i)
    }

    public mutating func removeRange(subRange: Range<Int>) {
        values.removeRange(subRange)
    }

    public mutating func removeAll(#keepCapacity: Bool) {
        values.removeAll(keepCapacity: keepCapacity)
    }
}
