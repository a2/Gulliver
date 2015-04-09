import AddressBook

public struct RelatedName: DebugPrintable, MultiValueRepresentable, Printable {
    public struct Labels {
        public static let Father = String(kABPersonFatherLabel)
        public static let Mother = String(kABPersonMotherLabel)
        public static let Parent = String(kABPersonParentLabel)
        public static let Brother = String(kABPersonBrotherLabel)
        public static let Sister = String(kABPersonSisterLabel)
        public static let Child = String(kABPersonChildLabel)
        public static let Friend = String(kABPersonFriendLabel)
        public static let Spouse = String(kABPersonSpouseLabel)
        public static let Partner = String(kABPersonPartnerLabel)
        public static let Assistant = String(kABPersonAssistantLabel)
        public static let Manager = String(kABPersonManagerLabel)
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
            self = RelatedName(stringValue: stringValue)
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
