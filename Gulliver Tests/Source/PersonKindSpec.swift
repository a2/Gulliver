import Gulliver
import Nimble
import Quick

class PersonKindSpec: QuickSpec {
    override func spec() {
        describe("Person") {
            it("has the correct rawValue") {
                expect(PersonKind.Person.rawValue) == kABPersonKindPerson
            }

            it("can be created with a CFNumberRef value") {
                let kind = PersonKind(rawValue: kABPersonKindPerson)
                expect(kind).notTo(beNil())
                expect(kind) == PersonKind.Person
            }
        }

        describe("Organization") {
            it("has the correct rawValue") {
                expect(PersonKind.Organization.rawValue) == kABPersonKindOrganization
            }

            it("can be created with a CFNumberRef value") {
                let kind = PersonKind(rawValue: kABPersonKindOrganization)
                expect(kind).notTo(beNil())
                expect(kind) == PersonKind.Organization
            }
        }
    }
}
