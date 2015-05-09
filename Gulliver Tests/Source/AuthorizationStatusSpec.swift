import AddressBook
import Gulliver
import Nimble
import Quick

class AuthorizationStatusSpec: QuickSpec {
    override func spec() {
        describe("NotDetermined") {
            it("has the correct rawValue") {
                expect(AuthorizationStatus.NotDetermined.rawValue) == ABAuthorizationStatus.NotDetermined
            }

            it("can be created with an ABAuthorizationStatus value") {
                let status = AuthorizationStatus(rawValue: .NotDetermined)
                expect(status).notTo(beNil())
                expect(status) == AuthorizationStatus.NotDetermined
            }
        }

        describe("Restricted") {
            it("has the correct rawValue") {
                expect(AuthorizationStatus.Restricted.rawValue) == ABAuthorizationStatus.Restricted
            }

            it("can be created with an ABAuthorizationStatus value") {
                let status = AuthorizationStatus(rawValue: .Restricted)
                expect(status).notTo(beNil())
                expect(status) == AuthorizationStatus.Restricted
            }
        }

        describe("Denied") {
            it("has the correct rawValue") {
                expect(AuthorizationStatus.Denied.rawValue) == ABAuthorizationStatus.Denied
            }

            it("can be created with an ABAuthorizationStatus value") {
                let status = AuthorizationStatus(rawValue: .Denied)
                expect(status).notTo(beNil())
                expect(status) == AuthorizationStatus.Denied
            }
        }

        describe("Authorized") {
            it("has the correct rawValue") {
                expect(AuthorizationStatus.Authorized.rawValue) == ABAuthorizationStatus.Authorized
            }

            it("can be created with an ABAuthorizationStatus value") {
                let status = AuthorizationStatus(rawValue: .Authorized)
                expect(status).notTo(beNil())
                expect(status) == AuthorizationStatus.Authorized
            }
        }
    }
}
