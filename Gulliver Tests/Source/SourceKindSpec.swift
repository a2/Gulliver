import Gulliver
import Nimble
import Quick

class SortKindSpec: QuickSpec {
    override func spec() {
        describe("Local") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeLocal)
                expect(SourceKind.Local.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeLocal))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.Local
            }

            it("is not searchable") {
                expect(SourceKind.Local.isSearchable) == false
            }
        }

        describe("Exchange") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeExchange)
                expect(SourceKind.Exchange.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeExchange))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.Exchange
            }

            it("is not searchable") {
                expect(SourceKind.Exchange.isSearchable) == false
            }
        }

        describe("ExchangeGAL") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeExchangeGAL)
                expect(SourceKind.ExchangeGAL.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeExchangeGAL))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.ExchangeGAL
            }

            it("is searchable") {
                expect(SourceKind.ExchangeGAL.isSearchable) == true
            }
        }

        describe("MobileMe") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeMobileMe)
                expect(SourceKind.MobileMe.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeMobileMe))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.MobileMe
            }

            it("is not searchable") {
                expect(SourceKind.MobileMe.isSearchable) == false
            }
        }

        describe("LDAP") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeLDAP)
                expect(SourceKind.LDAP.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeLDAP))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.LDAP
            }

            it("is searchable") {
                expect(SourceKind.LDAP.isSearchable) == true
            }
        }

        describe("CardDAV") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeCardDAV)
                expect(SourceKind.CardDAV.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeCardDAV))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.CardDAV
            }

            it("is not searchable") {
                expect(SourceKind.CardDAV.isSearchable) == false
            }
        }

        describe("CardDAVSearch") {
            it("has the correct rawValue") {
                let correctValue: ABSourceType = numericCast(kABSourceTypeCardDAVSearch)
                expect(SourceKind.CardDAVSearch.rawValue) == correctValue
            }

            it("can be created with an ABSourceType value") {
                let kind = SourceKind(rawValue: numericCast(kABSourceTypeCardDAVSearch))
                expect(kind).notTo(beNil())
                expect(kind) == SourceKind.CardDAVSearch
            }

            it("is searchable") {
                expect(SourceKind.CardDAVSearch.isSearchable) == true
            }
        }
    }
}
