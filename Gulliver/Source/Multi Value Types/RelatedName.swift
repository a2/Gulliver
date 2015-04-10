import AddressBook

public struct RelatedName: MultiValueRepresentable, Printable {
    public struct Labels {
        public static let Father = kABPersonFatherLabel as String
        public static let Mother = kABPersonMotherLabel as String
        public static let Parent = kABPersonParentLabel as String
        public static let Brother = kABPersonBrotherLabel as String
        public static let Sister = kABPersonSisterLabel as String
        public static let Child = kABPersonChildLabel as String
        public static let Friend = kABPersonFriendLabel as String
        public static let Spouse = kABPersonSpouseLabel as String
        public static let Partner = kABPersonPartnerLabel as String
        public static let Assistant = kABPersonAssistantLabel as String
        public static let Manager = kABPersonManagerLabel as String
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
}
