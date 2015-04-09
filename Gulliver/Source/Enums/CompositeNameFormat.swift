import AddressBook

public enum CompositeNameFormat: RawRepresentable {
    case FirstNameFirst
    case LastNameFirst

    public var rawValue: ABPersonCompositeNameFormat {
        switch self {
        case .FirstNameFirst:
            return numericCast(kABPersonCompositeNameFormatFirstNameFirst)
        case .LastNameFirst:
            return numericCast(kABPersonCompositeNameFormatLastNameFirst)
        }
    }

    public init?(rawValue: ABPersonCompositeNameFormat) {
        switch rawValue {
        case numericCast(kABPersonCompositeNameFormatFirstNameFirst):
            self = .FirstNameFirst
        case numericCast(kABPersonCompositeNameFormatLastNameFirst):
            self = .LastNameFirst
        default:
            return nil
        }
    }
}
