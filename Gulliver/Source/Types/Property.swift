import AddressBook

public protocol PropertyType {
    typealias ValueType
    var propertyID: ABPropertyID { get }
}

public protocol ReadablePropertyType: PropertyType {
    var readTransform: (CFTypeRef -> ValueType)? { get }
}

public protocol WritablePropertyType: PropertyType {
    var writeTransform: (ValueType -> CFTypeRef)? { get }
}

public struct Property<T>: ReadablePropertyType {
    typealias ValueType = T

    public let propertyID: ABPropertyID
    public let readTransform: (CFTypeRef -> T)?

    init(propertyID: ABPropertyID, readTransform: (CFTypeRef -> T)? = nil) {
        self.propertyID = propertyID
        self.readTransform = readTransform
    }
}

public struct MutableProperty<T>: ReadablePropertyType, WritablePropertyType {
    typealias ValueType = T

    public let propertyID: ABPropertyID
    public let readTransform: (CFTypeRef -> T)?
    public let writeTransform: (T -> CFTypeRef)?

    init(propertyID: ABPropertyID, readTransform: (CFTypeRef -> T)? = nil, writeTransform: (T -> CFTypeRef)? = nil) {
        self.propertyID = propertyID
        self.readTransform = readTransform
        self.writeTransform = writeTransform
    }
}

func readTransform<T: RawRepresentable>(value: CFTypeRef) -> T {
    return T(rawValue: value as! T.RawValue)!
}

func writeTransform<T: RawRepresentable>(value: T) -> CFTypeRef {
    return value.rawValue as! CFTypeRef
}
