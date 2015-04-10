import AddressBook
import Foundation

public struct MultiDate: Printable, MultiValueRepresentable {
    public var value: NSDate

    public init(_ value: NSDate) {
        self.value = value
    }

    public static let multiValueType = PropertyKind.MultiDateTime

    public var multiValueRepresentation: CFTypeRef {
        return value
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let value = multiValueRepresentation as? NSDate {
            self.value = value
        } else {
            return nil
        }
    }

    public var description: String {
        return value.description
    }
}

public struct Date {
    public struct Labels {
        public static let Anniversary = kABPersonAnniversaryLabel as String
    }
}
