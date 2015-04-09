import AddressBook

public struct PhoneNumber: DebugPrintable, MultiValueRepresentable, Printable {
    public struct Labels {
        public static let Mobile = String(kABPersonPhoneMobileLabel)
        public static let IPhone = String(kABPersonPhoneIPhoneLabel)
        public static let Main = String(kABPersonPhoneMainLabel)
        public static let HomeFAX = String(kABPersonPhoneHomeFAXLabel)
        public static let WorkFAX = String(kABPersonPhoneWorkFAXLabel)
        public static let OtherFAX = String(kABPersonPhoneOtherFAXLabel)
        public static let Pager = String(kABPersonPhonePagerLabel)
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

    public var debugDescription: String {
        return stringValue
    }
}