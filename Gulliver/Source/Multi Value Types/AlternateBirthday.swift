//
//  AlternateBirthday.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/13/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public struct AlternateBirthday {

    var calendarIdentifier: String = NSCalendarIdentifierGregorian
    var era: Int
    var year: Int
    var month: Int
    var day: Int
    var isLeapMonth: Bool = false

    var calendar: NSCalendar {
        get {
            return NSCalendar(calendarIdentifier: self.calendarIdentifier)!
        }
        set {
            self.calendarIdentifier = newValue.calendarIdentifier
        }
    }

}

extension AlternateBirthday: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiDictionary
    }

    public var multiValueRepresentation: AnyObject {
        return [
            kABPersonAlternateBirthdayCalendarIdentifierKey as String: calendarIdentifier,
            kABPersonAlternateBirthdayDayKey as String: NSNumber(integer: day),
            kABPersonAlternateBirthdayEraKey as String: NSNumber(integer: era),
            kABPersonAlternateBirthdayIsLeapMonthKey as String: NSNumber(bool: isLeapMonth),
            kABPersonAlternateBirthdayMonthKey as String: NSNumber(integer: month),
            kABPersonAlternateBirthdayYearKey as String: NSNumber(integer: year)
        ]
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let dictionary = multiValueRepresentation as? NSDictionary {
            let calendarIdentifier = dictionary[kABPersonAlternateBirthdayCalendarIdentifierKey as String] as String
            let day = dictionary[kABPersonAlternateBirthdayDayKey as String] as NSNumber
            let era = dictionary[kABPersonAlternateBirthdayEraKey as String] as NSNumber
            let isLeapMonth = dictionary[kABPersonAlternateBirthdayIsLeapMonthKey as String] as? NSNumber ?? NSNumber(bool: false)
            let month = dictionary[kABPersonAlternateBirthdayMonthKey as String] as NSNumber
            let year = dictionary[kABPersonAlternateBirthdayYearKey as String] as NSNumber

            self = AlternateBirthday(calendarIdentifier: calendarIdentifier, era: era.integerValue, year: year.integerValue, month: month.integerValue, day: day.integerValue, isLeapMonth: isLeapMonth.boolValue)
        } else {
            return nil
        }
    }

}
