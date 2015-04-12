import Gulliver
import Nimble
import Quick

class AlternateBirthdaySpec: QuickSpec {
    override func spec() {
        describe("rawValue") {
            it("should contain the correct data") {
                let birthday = AlternateBirthday(calendarIdentifier: NSCalendarIdentifierHebrew, era: 0, year: 5775, month: 7, day: 24, isLeapMonth: false)
                let rawValue = birthday.rawValue
                expect((rawValue[kABPersonAlternateBirthdayCalendarIdentifierKey as String] as! String)) == NSCalendarIdentifierHebrew
                expect((rawValue[kABPersonAlternateBirthdayDayKey as String] as! Int)) == 24
                expect((rawValue[kABPersonAlternateBirthdayEraKey as String] as! Int)) == 0
                expect((rawValue[kABPersonAlternateBirthdayIsLeapMonthKey as String] as! Bool)) == false
                expect((rawValue[kABPersonAlternateBirthdayMonthKey as String] as! Int)) == 7
                expect((rawValue[kABPersonAlternateBirthdayYearKey as String] as! Int)) == 5775
            }

            it("is a valid representation") {
                let birthday = AlternateBirthday(calendarIdentifier: NSCalendarIdentifierHebrew, era: 0, year: 5775, month: 7, day: 24, isLeapMonth: false)

                let record: ABRecordRef = ABPersonCreate().takeRetainedValue()
                var error: Unmanaged<CFErrorRef>? = nil
                if !ABRecordSetValue(record, kABPersonAlternateBirthdayProperty, birthday.rawValue, &error) {
                    let nsError = (error?.takeUnretainedValue()).map { unsafeBitCast($0, NSError.self) }
                    fail("Could not set value on record: \(nsError?.localizedDescription)")
                }
            }
        }

        describe("init(rawValue:)") {
            it("creates a valid AlternateBirthday") {
                let rawValue: [NSObject : AnyObject] = [
                    kABPersonAlternateBirthdayCalendarIdentifierKey as String: NSCalendarIdentifierHebrew,
                    kABPersonAlternateBirthdayDayKey as String: 24,
                    kABPersonAlternateBirthdayEraKey as String: 0,
                    kABPersonAlternateBirthdayIsLeapMonthKey as String: false,
                    kABPersonAlternateBirthdayMonthKey as String: 7,
                    kABPersonAlternateBirthdayYearKey as String: 5775,
                ]

                let birthday = AlternateBirthday(rawValue: rawValue)
                expect(birthday).notTo(beNil())
                expect(birthday!.calendarIdentifier) == NSCalendarIdentifierHebrew
                expect(birthday!.day) == 24
                expect(birthday!.era) == 0
                expect(birthday!.isLeapMonth) == false
                expect(birthday!.month) == 7
                expect(birthday!.year) == 5775
            }

            it("fails if a required key is not present") {
                let correctRawValue: [NSObject : AnyObject] = [
                    kABPersonAlternateBirthdayCalendarIdentifierKey as String: NSCalendarIdentifierHebrew,
                    kABPersonAlternateBirthdayDayKey as String: 24,
                    kABPersonAlternateBirthdayEraKey as String: 0,
                    kABPersonAlternateBirthdayIsLeapMonthKey as String: false,
                    kABPersonAlternateBirthdayMonthKey as String: 7,
                    kABPersonAlternateBirthdayYearKey as String: 5775,
                ]

                for index in indices(correctRawValue) {
                    var rawValue = correctRawValue
                    rawValue.removeAtIndex(index)

                    let birthday = AlternateBirthday(rawValue: rawValue)
                    expect(birthday).to(beNil())
                }
            }

            it("works with vCard data") {
                let fileURL = NSBundle(forClass: AlternateBirthdaySpec.self).URLForResource("Johnny B. Goode", withExtension: "vcf")!
                let data = NSData(contentsOfURL: fileURL)!
                let records = ABPersonCreatePeopleInSourceWithVCardRepresentation(nil, data as CFDataRef).takeRetainedValue() as [ABRecordRef]
                let rawValue = ABRecordCopyValue(records[0], kABPersonAlternateBirthdayProperty)!.takeRetainedValue() as! [NSObject : AnyObject]

                let birthday = AlternateBirthday(rawValue: rawValue)
                expect(birthday).notTo(beNil())
                expect(birthday!.calendarIdentifier) == NSCalendarIdentifierHebrew
                expect(birthday!.day) == 24
                expect(birthday!.era) == 0
                expect(birthday!.isLeapMonth) == false
                expect(birthday!.month) == 7
                expect(birthday!.year) == 5775
            }
        }

        describe("dateComponents") {
            it("should contain the correct data") {
                let birthday = AlternateBirthday(calendarIdentifier: NSCalendarIdentifierHebrew, era: 0, year: 5775, month: 7, day: 24, isLeapMonth: false)
                let components = birthday.dateComponents
                expect(components.calendar?.calendarIdentifier) == NSCalendarIdentifierHebrew
                expect(components.day) == 24
                expect(components.era) == 0
                expect(components.leapMonth) == false
                expect(components.month) == 7
                expect(components.year) == 5775
            }
        }

        describe("init(dateComponents:)") {
            it("creates a valid AlternateBirthday") {
                let dateComponents = NSDateComponents()
                dateComponents.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierHebrew)
                dateComponents.day = 24
                dateComponents.era = 0
                dateComponents.leapMonth = false
                dateComponents.month = 7
                dateComponents.year = 5775

                let birthday = AlternateBirthday(dateComponents: dateComponents)
                expect(birthday).notTo(beNil())
                expect(birthday!.calendarIdentifier) == NSCalendarIdentifierHebrew
                expect(birthday!.day) == 24
                expect(birthday!.era) == 0
                expect(birthday!.isLeapMonth) == false
                expect(birthday!.month) == 7
                expect(birthday!.year) == 5775
            }

            it("fails if a required value is not present") {
                let allConfigurationBlocks: [NSDateComponents -> Void] = [
                    { $0.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierHebrew) },
                    { $0.day = 24 },
                    { $0.era = 0 },
                    { $0.month = 7 },
                    { $0.year = 5775 },
                ]

                for index in indices(allConfigurationBlocks) {
                    let dateComponents = NSDateComponents()

                    var configurationBlocks = allConfigurationBlocks

                    // Assignment to _ is necessary because the result is "NSDateComponents -> Void"
                    // and the compiler warns about an unused function result. The idea is that we
                    // don't want to execute it, but simply remove it from the array.
                    _ = configurationBlocks.removeAtIndex(index)

                    for block in configurationBlocks {
                        block(dateComponents)
                    }

                    let birthday = AlternateBirthday(dateComponents: dateComponents)
                    expect(birthday).to(beNil())
                }
            }
        }

    }
}
