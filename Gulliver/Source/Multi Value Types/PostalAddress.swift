//
//  PostalAddress.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/11/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook
import AddressBookUI

public struct PostalAddress {

    public var street: String?
    public var city: String?
    public var state: String?
    public var ZIP: String?
    public var country: String?
    public var countryCode: String?
    public var otherFields: [String : String] = [:]

    public init() {

    }
    
}

extension PostalAddress: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiDictionary
    }

    public var multiValueRepresentation: AnyObject {
        var result = otherFields

        if street != nil {
            result[kABPersonAddressStreetKey] = street
        }

        if city != nil {
            result[kABPersonAddressCityKey] = city
        }

        if state != nil {
            result[kABPersonAddressStateKey] = state
        }

        if ZIP != nil {
            result[kABPersonAddressZIPKey] = ZIP
        }

        if country != nil {
            result[kABPersonAddressCountryKey] = country
        }

        if countryCode != nil {
            result[kABPersonAddressCountryCodeKey] = countryCode
        }

        return result
    }

    public init?(multiValueRepresentation: AnyObject) {
        for (key, value) in multiValueRepresentation as [String : String] {
            switch key {
            case kABPersonAddressStreetKey:
                self.street = value
            case kABPersonAddressCityKey:
                self.city = value
            case kABPersonAddressStateKey:
                self.state = value
            case kABPersonAddressZIPKey:
                self.ZIP = value
            case kABPersonAddressCountryKey:
                self.country = value
            case kABPersonAddressCountryCodeKey:
                self.countryCode = value
            default:
                self.otherFields[key] = value
            }
        }
    }

}

extension PostalAddress: Printable {

    public var description: String {
        let address = multiValueRepresentation as NSDictionary
        return ABCreateStringWithAddressDictionary(address, true)
    }

}

extension PostalAddress: DebugPrintable {

    public var debugDescription: String {
        return "\(multiValueRepresentation)"
    }

}
