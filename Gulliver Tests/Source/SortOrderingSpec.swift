import Gulliver
import Nimble
import Quick

class SortOrderingSpec: QuickSpec {
    override func spec() {
        describe("ByFirstName") {
            it("has the correct rawValue") {
                let correctValue: ABPersonSortOrdering = numericCast(kABPersonSortByFirstName)
                expect(SortOrdering.ByFirstName.rawValue) == correctValue
            }

            it("can be created with an ABPersonSortOrdering value") {
                let sortOrdering = SortOrdering(rawValue: numericCast(kABPersonSortByFirstName))
                expect(sortOrdering).notTo(beNil())
                expect(sortOrdering) == SortOrdering.ByFirstName
            }
        }

        describe("ByLastName") {
            it("has the correct rawValue") {
                let correctValue: ABPersonSortOrdering = numericCast(kABPersonSortByLastName)
                expect(SortOrdering.ByLastName.rawValue) == correctValue
            }

            it("can be created with an ABPersonSortOrdering value") {
                let sortOrdering = SortOrdering(rawValue: numericCast(kABPersonSortByLastName))
                expect(sortOrdering).notTo(beNil())
                expect(sortOrdering) == SortOrdering.ByLastName
            }
        }
    }
}