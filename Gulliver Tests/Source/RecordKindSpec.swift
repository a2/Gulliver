import Gulliver
import Nimble
import Quick

class RecordKindSpec: QuickSpec {
    override func spec() {
        describe("Person") {
            it("has the correct rawValue") {
                let correctValue: ABRecordType = numericCast(kABPersonType)
                expect(RecordKind.Person.rawValue) == correctValue
            }

            it("can be created with an ABRecordType value") {
                let kind = RecordKind(rawValue: numericCast(kABPersonType))
                expect(kind).notTo(beNil())
                expect(kind) == RecordKind.Person
            }
        }

        describe("Group") {
            it("has the correct rawValue") {
                let correctValue: ABRecordType = numericCast(kABGroupType)
                expect(RecordKind.Group.rawValue) == correctValue
            }

            it("can be created with an ABRecordType value") {
                let kind = RecordKind(rawValue: numericCast(kABGroupType))
                expect(kind).notTo(beNil())
                expect(kind) == RecordKind.Group
            }
        }

        describe("Source") {
            it("has the correct rawValue") {
                let correctValue: ABRecordType = numericCast(kABSourceType)
                expect(RecordKind.Source.rawValue) == correctValue
            }

            it("can be created with an ABRecordType value") {
                let kind = RecordKind(rawValue: numericCast(kABSourceType))
                expect(kind).notTo(beNil())
                expect(kind) == RecordKind.Source
            }
        }
    }
}