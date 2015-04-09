import AddressBook

public enum AuthorizationStatus: RawRepresentable {
    case NotDetermined
    case Restricted
    case Denied
    case Authorized

    public var rawValue: ABAuthorizationStatus {
        switch self {
        case .NotDetermined:
            return .NotDetermined
        case .Restricted:
            return .Restricted
        case .Denied:
            return .Denied
        case .Authorized:
            return .Authorized
        }
    }

    public init?(rawValue: ABAuthorizationStatus) {
        switch rawValue {
        case .NotDetermined:
            self = .NotDetermined
        case .Restricted:
            self = .Restricted
        case .Denied:
            self = .Denied
        case .Authorized:
            self = .Authorized
        }
    }
}
