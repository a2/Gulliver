public struct Date: DebugPrintable, MultiValueRepresentable {
    public struct Labels {
        static let Anniversary = String(kABPersonAnniversaryLabel)
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

    public var debugDescription: String {
        return "\(dateValue)"
    }
}
