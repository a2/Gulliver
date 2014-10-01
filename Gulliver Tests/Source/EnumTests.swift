
//
//  EnumTests.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/18/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import Gulliver
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

    func testPropertyTypeRawRepresentable() {
        let rawValues: [ABPropertyType] = [
            ABPropertyType(kABInvalidPropertyType),
            ABPropertyType(kABStringPropertyType),
            ABPropertyType(kABIntegerPropertyType),
            ABPropertyType(kABRealPropertyType),
            ABPropertyType(kABDateTimePropertyType),
            ABPropertyType(kABDictionaryPropertyType),
            ABPropertyType(kABMultiStringPropertyType),
            ABPropertyType(kABMultiIntegerPropertyType),
            ABPropertyType(kABMultiRealPropertyType),
            ABPropertyType(kABMultiDateTimePropertyType),
            ABPropertyType(kABMultiDictionaryPropertyType),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(PropertyType(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testPropertyTypeIsMulti() {
        let propertyTypes: [PropertyType : Bool] = [
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

    func testPropertyTypeIsValid() {
        let propertyTypes: [PropertyType : Bool] = [
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
            ABPersonSortOrdering(kABPersonSortByFirstName),
            ABPersonSortOrdering(kABPersonSortByLastName),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(SortOrdering(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testSourceTypeRawRepresentable() {
        let rawValues: [ABSourceType] = [
            ABSourceType(kABSourceTypeLocal),
            ABSourceType(kABSourceTypeExchange),
            ABSourceType(kABSourceTypeExchangeGAL),
            ABSourceType(kABSourceTypeMobileMe),
            ABSourceType(kABSourceTypeLDAP),
            ABSourceType(kABSourceTypeCardDAV),
            ABSourceType(kABSourceTypeCardDAVSearch),
        ]

        for rawValue in rawValues {
            XCTAssertEqual(SourceType(rawValue: rawValue)!.rawValue, rawValue, "\(rawValue) did not transform successfully")
        }
    }

    func testSourceTypeIsSearchable() {
        let sourceTypes: [SourceType : Bool] = [
            .Local: false,
            .Exchange: false,
            .ExchangeGAL: true,
            .MobileMe: false,
            .LDAP: true,
            .CardDAV: false,
            .CardDAVSearch: true,
        ]

        for (sourceType, isSearchable) in sourceTypes {
            XCTAssertEqual(sourceType.isSearchable, isSearchable, "Expected \(sourceType).isSearchable == \(isSearchable)")
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
