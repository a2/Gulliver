import AddressBook

public struct AlternateBirthday: MultiValueRepresentable {
    var calendarIdentifier: String
    var era: Int
    var year: Int
    var month: Int
    var day: Int
    var isLeapMonth: Bool

    var calendar: NSCalendar {
        get {
            return NSCalendar(calendarIdentifier: self.calendarIdentifier)!
        }
        set {
            self.calendarIdentifier = newValue.calendarIdentifier
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
            kABPersonAlternateBirthdayDayKey as String: NSNumber(integer: day),
            kABPersonAlternateBirthdayEraKey as String: NSNumber(integer: era),
            kABPersonAlternateBirthdayIsLeapMonthKey as String: NSNumber(bool: isLeapMonth),
            kABPersonAlternateBirthdayMonthKey as String: NSNumber(integer: month),
            kABPersonAlternateBirthdayYearKey as String: NSNumber(integer: year)
        ]
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? NSDictionary {
            let calendarIdentifier = dictionary[kABPersonAlternateBirthdayCalendarIdentifierKey as String] as! String
            let day = dictionary[kABPersonAlternateBirthdayDayKey as String] as! NSNumber
            let era = dictionary[kABPersonAlternateBirthdayEraKey as String] as! NSNumber
            let isLeapMonth = dictionary[kABPersonAlternateBirthdayIsLeapMonthKey as String] as? NSNumber ?? NSNumber(bool: false)
            let month = dictionary[kABPersonAlternateBirthdayMonthKey as String] as! NSNumber
            let year = dictionary[kABPersonAlternateBirthdayYearKey as String] as! NSNumber

            self = AlternateBirthday(calendarIdentifier: calendarIdentifier, era: era.integerValue, year: year.integerValue, month: month.integerValue, day: day.integerValue, isLeapMonth: isLeapMonth.boolValue)
        } else {
            return nil
        }
    }
}
