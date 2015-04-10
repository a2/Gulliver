import AddressBook

public struct MultiString: MultiValueRepresentable, Printable, StringLiteralConvertible {
    public var value: String

    public init(_ value: String) {
        self.value = value
    }

    public static let multiValueType = PropertyKind.MultiString

    public var multiValueRepresentation: CFTypeRef {
        return value
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let value = multiValueRepresentation as? String {
            self.value = value
        } else {
            return nil
        }
    }

    public var description: String {
        return value
    }

    public init(stringLiteral: String) {
        self.value = stringLiteral
    }

    public init(extendedGraphemeClusterLiteral: String) {
        self.value = extendedGraphemeClusterLiteral
    }

    public init(unicodeScalarLiteral: String) {
        self.value = unicodeScalarLiteral
    }
}

public struct PhoneNumber {
    public struct Labels {
        public static let Mobile = kABPersonPhoneMobileLabel as String
        public static let IPhone = kABPersonPhoneIPhoneLabel as String
        public static let Main = kABPersonPhoneMainLabel as String
        public static let HomeFAX = kABPersonPhoneHomeFAXLabel as String
        public static let WorkFAX = kABPersonPhoneWorkFAXLabel as String
        public static let OtherFAX = kABPersonPhoneOtherFAXLabel as String
        public static let Pager = kABPersonPhonePagerLabel as String
    }
}

public struct URL {
    public struct Labels {
        public static let HomePage = kABPersonHomePageLabel as String
    }
}
