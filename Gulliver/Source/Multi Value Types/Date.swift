public struct Date: Printable, MultiValueRepresentable {
    public struct Labels {
        public static let Anniversary = kABPersonAnniversaryLabel as String
    }

    public var dateValue: NSDate

    public init(dateValue: NSDate) {
        self.dateValue = dateValue
    }

    public static let multiValueType = PropertyKind.MultiDateTime

    public var multiValueRepresentation: CFTypeRef {
        return dateValue
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dateValue = multiValueRepresentation as? NSDate {
            self = Date(dateValue: dateValue)
        } else {
            return nil
        }
    }

    public var description: String {
        return dateValue.description
    }
}
