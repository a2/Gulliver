import AddressBook
import Foundation

public struct MultiDate: Comparable, Equatable, Printable, MultiValueRepresentable {
    public var value: NSDate

    public init(_ value: NSDate) {
        self.value = value
    }

    public static let multiValueType = PropertyKind.DateTime

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

public func ==(lhs: MultiDate, rhs: MultiDate) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: MultiDate, rhs: MultiDate) -> Bool {
    return lhs.value.compare(rhs.value) == .OrderedAscending
}

public struct Date {
    public struct Labels {
        public static let Anniversary = kABPersonAnniversaryLabel as String
    }
}
