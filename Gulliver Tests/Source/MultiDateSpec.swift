import AddressBook
import Gulliver
import Nimble
import Quick

class MultiDateSpec: QuickSpec {
    override func spec() {
        describe("multiValueRepresentation") {
            it("should equal value") {
                let now = NSDate()
                let multiDate = MultiDate(now)
                expect(multiDate.value) == now
            }
        }

        describe("init(multiValueRepresentation:)") {
            it("should set value to the input") {
                let now = NSDate()
                let multiDate = MultiDate(multiValueRepresentation: now)
                expect(multiDate).notTo(beNil())
                expect(multiDate!.value) == now
            }

            it("should fail for non-date inputs") {
                let string = "not a date"
                let multiDate = MultiDate(multiValueRepresentation: string)
                expect(multiDate).to(beNil())
            }
        }

        describe("==") {
            it("should return true if values are equal") {
                let dateA = NSDate()
                let dateB = dateA.copy() as! NSDate
                expect(dateA) == dateB

                let multiDateA = MultiDate(dateA)
                let multiDateB = MultiDate(dateB)
                expect(multiDateA) == multiDateB
            }

            it("should return false if values are different") {
                let dateA = NSDate()
                let dateB = dateA.dateByAddingTimeInterval(10.0)
                expect(dateA) != dateB

                let multiDateA = MultiDate(dateA)
                let multiDateB = MultiDate(dateB)
                expect(multiDateA) != multiDateB
            }
        }

        describe("<") {
            it("should be true if a.value < b.value") {
                let dateA = NSDate()
                let dateB = dateA.dateByAddingTimeInterval(10.0)
                expect(dateA.compare(dateB)) == NSComparisonResult.OrderedAscending

                let multiDateA = MultiDate(dateA)
                let multiDateB = MultiDate(dateB)
                expect(multiDateA) < multiDateB
            }

            it("shuld be false if !(a.value < b.value)") {
                let dateA = NSDate()
                let dateB = dateA.copy() as! NSDate
                expect(dateA.compare(dateB)) != NSComparisonResult.OrderedAscending

                let multiDateA = MultiDate(dateA)
                let multiDateB = MultiDate(dateB)
                expect(multiDateA < multiDateB) == false
            }
        }
    }
}
