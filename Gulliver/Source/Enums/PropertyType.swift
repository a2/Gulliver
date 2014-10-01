//
//  PropertyType.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/11/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum PropertyType {
    case Invalid
    case String
    case Integer
    case Real
    case DateTime
    case Dictionary
    case MultiString
    case MultiInteger
    case MultiReal
    case MultiDateTime
    case MultiDictionary

    public var isValid: Bool {
        return self != .Invalid
    }

    public var isMulti: Bool {
        return self.rawValue.toIntMax() & kABMultiValueMask.toIntMax() != 0
    }
}

extension PropertyType: RawRepresentable {

    public var rawValue: ABPropertyType {
        var intValue: Int

        switch self {
        case .Invalid:
            intValue = kABInvalidPropertyType
        case .String:
            intValue = kABStringPropertyType
        case .Integer:
            intValue = kABIntegerPropertyType
        case .Real:
            intValue = kABRealPropertyType
        case .DateTime:
            intValue = kABDateTimePropertyType
        case .Dictionary:
            intValue = kABDictionaryPropertyType
        case .MultiString:
            intValue = kABMultiStringPropertyType
        case .MultiInteger:
            intValue = kABMultiIntegerPropertyType
        case .MultiReal:
            intValue = kABMultiRealPropertyType
        case .MultiDateTime:
            intValue = kABMultiDateTimePropertyType
        case .MultiDictionary:
            intValue = kABMultiDictionaryPropertyType
        }

        return ABPropertyType(intValue)
    }

    public init?(rawValue: ABPropertyType) {
        switch Int(rawValue) {
        case kABInvalidPropertyType:
            self = .Invalid
        case kABStringPropertyType:
            self = .String
        case kABIntegerPropertyType:
            self = .Integer
        case kABRealPropertyType:
            self = .Real
        case kABDateTimePropertyType:
            self = .DateTime
        case kABDictionaryPropertyType:
            self = .Dictionary
        case kABMultiStringPropertyType:
            self = .MultiString
        case kABMultiIntegerPropertyType:
            self = .MultiInteger
        case kABMultiRealPropertyType:
            self = .MultiReal
        case kABMultiDateTimePropertyType:
            self = .MultiDateTime
        case kABMultiDictionaryPropertyType:
            self = .MultiDictionary
        default:
            return nil
        }
    }
    
}
