import Gulliver
import Lustre
import XCTest

class EnumTests: XCTestCase {

    override func setUp() {
        // Create an unused address book to populate values that are not compile
        // time constant (e.g. CFNumberRef).
        ABAddressBookCreateWithOptions(nil, nil).release()
    }

    func testAuthorizationStatusRawRepresentable() {
        let rawValues: [ABAuthorizationStatus] = [
            .NotDetermined,
            .Restricted,
            .Denied,
            .Authorized,
        ]

        for rawValue in rawValues {
            XCTAssertEqual(AuthorizationStatus(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testCompositeNameFormatRawRepresentable() {
        let rawValues: [ABPersonCompositeNameFormat] = [
            ABPersonCompositeNameFormat(kABPersonCompositeNameFormatFirstNameFirst),
            ABPersonCompositeNameFormat(kABPersonCompositeNameFormatLastNameFirst),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(CompositeNameFormat(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testImageFormatRawRepresentable() {
        let rawValues: [ABPersonImageFormat] = [
            kABPersonImageFormatThumbnail,
            kABPersonImageFormatOriginalSize,
        ]

        for rawValue in rawValues {
            XCTAssertEqual(ImageFormat(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testPersonKindRawRepresentable() {
        let rawValues: [CFNumberRef] = [
            kABPersonKindPerson,
            kABPersonKindOrganization,
        ]

        for rawValue in rawValues {
            XCTAssertEqual(PersonKind(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testPropertyKindRawRepresentable() {
        let rawValues: [ABPropertyType] = [
            numericCast(kABInvalidPropertyType),
            numericCast(kABStringPropertyType),
            numericCast(kABIntegerPropertyType),
            numericCast(kABRealPropertyType),
            numericCast(kABDateTimePropertyType),
            numericCast(kABDictionaryPropertyType),
            numericCast(kABMultiStringPropertyType),
            numericCast(kABMultiIntegerPropertyType),
            numericCast(kABMultiRealPropertyType),
            numericCast(kABMultiDateTimePropertyType),
            numericCast(kABMultiDictionaryPropertyType),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(PropertyKind(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testPropertyKindIsMulti() {
        let propertyTypes: [PropertyKind : Bool] = [
            .Invalid: false,
            .String: false,
            .Integer: false,
            .Real: false,
            .DateTime: false,
            .Dictionary: false,
            .MultiString: true,
            .MultiInteger: true,
            .MultiReal: true,
            .MultiDateTime: true,
            .MultiDictionary: true,
        ]

        for (propertyType, isMulti) in propertyTypes {
            XCTAssertEqual(propertyType.isMulti, isMulti, "Expected \(propertyType).isMulti == \(isMulti)")
        }
    }

    func testPropertyKindIsValid() {
        let propertyTypes: [PropertyKind : Bool] = [
            .Invalid: false,
            .String: true,
            .Integer: true,
            .Real: true,
            .DateTime: true,
            .Dictionary: true,
            .MultiString: true,
            .MultiInteger: true,
            .MultiReal: true,
            .MultiDateTime: true,
            .MultiDictionary: true,
        ]

        for (propertyType, isValid) in propertyTypes {
            XCTAssertEqual(propertyType.isValid, isValid, "Expected \(propertyType).isValid == \(isValid)")
        }
    }

    func testSortOrderingRawRepresentable() {
        let rawValues: [ABPersonSortOrdering] = [
            numericCast(kABPersonSortByFirstName),
            numericCast(kABPersonSortByLastName),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(SortOrdering(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testSourceKindRawRepresentable() {
        let rawValues: [ABSourceType] = [
            numericCast(kABSourceTypeLocal),
            numericCast(kABSourceTypeExchange),
            numericCast(kABSourceTypeExchangeGAL),
            numericCast(kABSourceTypeMobileMe),
            numericCast(kABSourceTypeLDAP),
            numericCast(kABSourceTypeCardDAV),
            numericCast(kABSourceTypeCardDAVSearch),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(SourceKind(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testSourceKindIsSearchable() {
        let sourceKinds: [SourceKind : Bool] = [
            .Local: false,
            .Exchange: false,
            .ExchangeGAL: true,
            .MobileMe: false,
            .LDAP: true,
            .CardDAV: false,
            .CardDAVSearch: true,
        ]

        for (sourceKind, isSearchable) in sourceKinds {
            XCTAssertEqual(sourceKind.isSearchable, isSearchable, "Expected \(sourceKind).isSearchable == \(isSearchable)")
        }
    }

}

extension ABPersonImageFormat: Equatable {
}

public func ==(lhs: ABPersonImageFormat, rhs: ABPersonImageFormat) -> Bool {
    return lhs.value == rhs.value
}

extension CFNumberRef: Equatable {
}

public func ==(lhs: CFNumberRef, rhs: CFNumberRef) -> Bool {
    return CFNumberCompare(lhs, rhs, nil) == CFComparisonResult.CompareEqualTo
}
