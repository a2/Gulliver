import AddressBook

public struct AlternateBirthday: MultiValueRepresentable {
    public var calendarIdentifier: String
    public var era: Int
    public var year: Int
    public var month: Int
    public var day: Int
    public var isLeapMonth: Bool

    public var calendar: NSCalendar {
        get {
            return NSCalendar(calendarIdentifier: calendarIdentifier)!
        }
        set {
            calendarIdentifier = newValue.calendarIdentifier
        }
    }

    public init(calendarIdentifier: String = NSCalendarIdentifierGregorian, era: Int, year: Int, month: Int, day: Int, isLeapMonth: Bool = false) {
        self.calendarIdentifier = calendarIdentifier
        self.era = era
        self.year = year
        self.month = month
        self.day = day
        self.isLeapMonth = isLeapMonth
    }

    public static let multiValueType = PropertyKind.MultiDictionary

    public var multiValueRepresentation: CFTypeRef {
        return [
            kABPersonAlternateBirthdayCalendarIdentifierKey as String: calendarIdentifier,
            kABPersonAlternateBirthdayDayKey as String: day,
            kABPersonAlternateBirthdayEraKey as String: era,
            kABPersonAlternateBirthdayIsLeapMonthKey as String: isLeapMonth,
            kABPersonAlternateBirthdayMonthKey as String: month,
            kABPersonAlternateBirthdayYearKey as String: year,
        ]
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? [NSObject : AnyObject] {
            self.calendarIdentifier = dictionary[kABPersonAlternateBirthdayCalendarIdentifierKey as String] as! String
            self.day = dictionary[kABPersonAlternateBirthdayDayKey as String] as! Int
            self.era = dictionary[kABPersonAlternateBirthdayEraKey as String] as! Int
            self.isLeapMonth = dictionary[kABPersonAlternateBirthdayIsLeapMonthKey as String] as? Bool ?? false
            self.month = dictionary[kABPersonAlternateBirthdayMonthKey as String] as! Int
            self.year = dictionary[kABPersonAlternateBirthdayYearKey as String] as! Int
        } else {
            return nil
        }
    }
}
