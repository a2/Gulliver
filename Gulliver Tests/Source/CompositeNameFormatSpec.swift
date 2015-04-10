import Gulliver
import Nimble
import Quick

class CompositeNameFormatSpec: QuickSpec {
    override func spec() {
        describe("FirstNameFirst") {
            it("has the correct rawValue") {
                let correctValue: ABPersonCompositeNameFormat = numericCast(kABPersonCompositeNameFormatFirstNameFirst)
                expect(CompositeNameFormat.FirstNameFirst.rawValue) == correctValue
            }

            it("can be created with an ABPersonCompositeNameFormat value") {
                let format = CompositeNameFormat(rawValue: numericCast(kABPersonCompositeNameFormatFirstNameFirst))
                expect(format).notTo(beNil())
                expect(format) == CompositeNameFormat.FirstNameFirst
            }
        }

        describe("LastNameFirst") {
            it("has the correct rawValue") {
                let correctValue: ABPersonCompositeNameFormat = numericCast(kABPersonCompositeNameFormatLastNameFirst)
                expect(CompositeNameFormat.LastNameFirst.rawValue) == correctValue
            }

            it("can be created with an ABPersonCompositeNameFormat value") {
                let format = CompositeNameFormat(rawValue: numericCast(kABPersonCompositeNameFormatLastNameFirst))
                expect(format).notTo(beNil())
                expect(format) == CompositeNameFormat.LastNameFirst
            }
        }
    }
}
