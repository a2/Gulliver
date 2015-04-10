import Gulliver
import Nimble
import Quick

class PropertyKindSpec: QuickSpec {
    override func spec() {
        describe("Invalid") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABInvalidPropertyType)
                expect(PropertyKind.Invalid.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABInvalidPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.Invalid
            }

            it("is not valid") {
                expect(PropertyKind.Invalid.isValid) == false
            }

            it("is not multi") {
                expect(PropertyKind.Invalid.isMulti) == false
            }
        }

        describe("String") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABStringPropertyType)
                expect(PropertyKind.String.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABStringPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.String
            }

            it("is valid") {
                expect(PropertyKind.String.isValid) == true
            }

            it("is not multi") {
                expect(PropertyKind.String.isMulti) == false
            }
        }

        describe("Integer") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABIntegerPropertyType)
                expect(PropertyKind.Integer.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABIntegerPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.Integer
            }

            it("is valid") {
                expect(PropertyKind.Integer.isValid) == true
            }

            it("is not multi") {
                expect(PropertyKind.Integer.isMulti) == false
            }
        }

        describe("Real") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABRealPropertyType)
                expect(PropertyKind.Real.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABRealPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.Real
            }

            it("is valid") {
                expect(PropertyKind.Real.isValid) == true
            }

            it("is not multi") {
                expect(PropertyKind.Real.isMulti) == false
            }
        }

        describe("DateTime") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABDateTimePropertyType)
                expect(PropertyKind.DateTime.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABDateTimePropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.DateTime
            }

            it("is valid") {
                expect(PropertyKind.DateTime.isValid) == true
            }

            it("is not multi") {
                expect(PropertyKind.DateTime.isMulti) == false
            }
        }

        describe("Dictionary") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABDictionaryPropertyType)
                expect(PropertyKind.Dictionary.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABDictionaryPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.Dictionary
            }

            it("is valid") {
                expect(PropertyKind.Dictionary.isValid) == true
            }

            it("is not multi") {
                expect(PropertyKind.Dictionary.isMulti) == false
            }
        }

        describe("MultiString") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABMultiStringPropertyType)
                expect(PropertyKind.MultiString.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABMultiStringPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.MultiString
            }

            it("is valid") {
                expect(PropertyKind.MultiString.isValid) == true
            }

            it("is multi") {
                expect(PropertyKind.MultiString.isMulti) == true
            }
        }

        describe("MultiInteger") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABMultiIntegerPropertyType)
                expect(PropertyKind.MultiInteger.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABMultiIntegerPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.MultiInteger
            }

            it("is valid") {
                expect(PropertyKind.MultiInteger.isValid) == true
            }

            it("is multi") {
                expect(PropertyKind.MultiInteger.isMulti) == true
            }
        }

        describe("MultiReal") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABMultiRealPropertyType)
                expect(PropertyKind.MultiReal.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABMultiRealPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.MultiReal
            }

            it("is valid") {
                expect(PropertyKind.MultiReal.isValid) == true
            }

            it("is multi") {
                expect(PropertyKind.MultiReal.isMulti) == true
            }
        }

        describe("MultiDateTime") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABMultiDateTimePropertyType)
                expect(PropertyKind.MultiDateTime.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABMultiDateTimePropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.MultiDateTime
            }

            it("is valid") {
                expect(PropertyKind.MultiDateTime.isValid) == true
            }

            it("is multi") {
                expect(PropertyKind.MultiDateTime.isMulti) == true
            }
        }

        describe("MultiDictionary") {
            it("has the correct rawValue") {
                let correctValue: ABPropertyType = numericCast(kABMultiDictionaryPropertyType)
                expect(PropertyKind.MultiDictionary.rawValue) == correctValue
            }

            it("can be created with an ABPropertyType value") {
                let kind = PropertyKind(rawValue: numericCast(kABMultiDictionaryPropertyType))
                expect(kind).notTo(beNil())
                expect(kind) == PropertyKind.MultiDictionary
            }

            it("is valid") {
                expect(PropertyKind.MultiDictionary.isValid) == true
            }

            it("is multi") {
                expect(PropertyKind.MultiDictionary.isMulti) == true
            }
        }
    }
}
