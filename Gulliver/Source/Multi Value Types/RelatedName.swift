import AddressBook

public struct RelatedName: DebugPrintable, MultiValueRepresentable, Printable {
    public struct Labels {
        static let Father = String(kABPersonFatherLabel)
        static let Mother = String(kABPersonMotherLabel)
        static let Parent = String(kABPersonParentLabel)
        static let Brother = String(kABPersonBrotherLabel)
        static let Sister = String(kABPersonSisterLabel)
        static let Child = String(kABPersonChildLabel)
        static let Friend = String(kABPersonFriendLabel)
        static let Spouse = String(kABPersonSpouseLabel)
        static let Partner = String(kABPersonPartnerLabel)
        static let Assistant = String(kABPersonAssistantLabel)
        static let Manager = String(kABPersonManagerLabel)
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
