import AddressBook

public struct PhoneNumber: MultiValueRepresentable, Printable {
    public struct Labels {
        public static let Mobile = kABPersonPhoneMobileLabel as String
        public static let IPhone = kABPersonPhoneIPhoneLabel as String
        public static let Main = kABPersonPhoneMainLabel as String
        public static let HomeFAX = kABPersonPhoneHomeFAXLabel as String
        public static let WorkFAX = kABPersonPhoneWorkFAXLabel as String
        public static let OtherFAX = kABPersonPhoneOtherFAXLabel as String
        public static let Pager = kABPersonPhonePagerLabel as String
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
            self = PhoneNumber(stringValue: stringValue)
        } else {
            return nil
        }
    }

    public var description: String {
        return stringValue
    }
}