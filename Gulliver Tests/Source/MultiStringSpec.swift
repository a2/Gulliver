import Gulliver
import Nimble
import Quick

class MultiStringSpec: QuickSpec {
    override func spec() {
        describe("multiValueRepresentation") {
            it("should equal value") {
                let string = "Hello, world!"
                let multiString = MultiString(string)
                expect(multiString.value) == string
            }
        }

        describe("init(multiValueRepresentation:)") {
            it("should set value to the input") {
                let string = "Hello, world!"
                let multiString = MultiString(multiValueRepresentation: string)
                expect(multiString).notTo(beNil())
                expect(multiString!.value) == string
            }

            it("should fail for non-string inputs") {
                let date = NSDate()
                let multiString = MultiString(multiValueRepresentation: date)
                expect(multiString).to(beNil())
            }
        }

        describe("==") {
            it("should return true if values are equal") {
                let stringA = "Hello, world!"
                let stringB = "Hello, world!"
                expect(stringA) == stringB

                let multiStringA = MultiString(stringA)
                let multiStringB = MultiString(stringB)
                expect(multiStringA) == multiStringB
            }

            it("should return false if values are different") {
                let stringA = "Hello, world!"
                let stringB = stringA + "?"
                expect(stringA) != stringB

                let multiStringA = MultiString(stringA)
                let multiStringB = MultiString(stringB)
                expect(multiStringA) != multiStringB
            }
        }
    }
}
