import AddressBook

public struct URL: DebugPrintable, MultiValueRepresentable, Printable {
    public struct Labels {
        public static let HomePage = kABPersonHomePageLabel as String
    }

    public var stringValue: String
    
    public init(stringValue: String) {
        self.stringValue = stringValue
    }

    public static let multiValueType = PropertyKind.MultiString

    public var multiValueRepresentation: CFTypeRef {
        return stringValue
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let stringValue = multiValueRepresentation as? String {
            self = URL(stringValue: stringValue)
        } else {
            return nil
        }
    }

    public var description: String {
        return stringValue
    }

    public var debugDescription: String {
        return stringValue
    }
}
