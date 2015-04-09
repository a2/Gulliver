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
            String(kABPersonAlternateBirthdayCalendarIdentifierKey): calendarIdentifier,
            String(kABPersonAlternateBirthdayDayKey): NSNumber(integer: day),
            String(kABPersonAlternateBirthdayEraKey): NSNumber(integer: era),
            String(kABPersonAlternateBirthdayIsLeapMonthKey): NSNumber(bool: isLeapMonth),
            String(kABPersonAlternateBirthdayMonthKey): NSNumber(integer: month),
            String(kABPersonAlternateBirthdayYearKey): NSNumber(integer: year)
        ]
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? NSDictionary {
            let calendarIdentifier = dictionary[String(kABPersonAlternateBirthdayCalendarIdentifierKey)] as! String
            let day = dictionary[String(kABPersonAlternateBirthdayDayKey)] as! NSNumber
            let era = dictionary[String(kABPersonAlternateBirthdayEraKey)] as! NSNumber
            let isLeapMonth = dictionary[String(kABPersonAlternateBirthdayIsLeapMonthKey)] as? NSNumber ?? NSNumber(bool: false)
            let month = dictionary[String(kABPersonAlternateBirthdayMonthKey)] as! NSNumber
            let year = dictionary[String(kABPersonAlternateBirthdayYearKey)] as! NSNumber

            self = AlternateBirthday(calendarIdentifier: calendarIdentifier, era: era.integerValue, year: year.integerValue, month: month.integerValue, day: day.integerValue, isLeapMonth: isLeapMonth.boolValue)
        } else {
            return nil
        }
    }
}
