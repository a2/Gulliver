import AddressBook

public struct PhoneNumber: DebugPrintable, MultiValueRepresentable, Printable {
    public struct Labels {
        static let Mobile = String(kABPersonPhoneMobileLabel)
        static let IPhone = String(kABPersonPhoneIPhoneLabel)
        static let Main = String(kABPersonPhoneMainLabel)
        static let HomeFAX = String(kABPersonPhoneHomeFAXLabel)
        static let WorkFAX = String(kABPersonPhoneWorkFAXLabel)
        static let OtherFAX = String(kABPersonPhoneOtherFAXLabel)
        static let Pager = String(kABPersonPhonePagerLabel)
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