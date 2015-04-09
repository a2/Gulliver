import AddressBook

public struct URL: MultiValueRepresentable {
    public struct Labels {
        public static let HomePage = String(kABPersonHomePageLabel)
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
    
}

extension URL: Printable {

    public var description: String {
        return stringValue
    }

}

extension URL: DebugPrintable {

    public var debugDescription: String {
        return stringValue
    }
    
}
