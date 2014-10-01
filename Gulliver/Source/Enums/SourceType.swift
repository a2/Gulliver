//
//  SourceType.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/10/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum SourceType {
    case Local
    case Exchange
    case ExchangeGAL
    case MobileMe
    case LDAP
    case CardDAV
    case CardDAVSearch

    public var isSearchable: Bool {
        return self.rawValue & kABSourceTypeSearchableMask != 0
    }
}

extension SourceType: RawRepresentable {

    public var rawValue: ABSourceType {
        var intValue: Int

        switch self {
        case .Local:
            intValue = kABSourceTypeLocal
        case .Exchange:
            intValue = kABSourceTypeExchange
        case .ExchangeGAL:
            intValue = kABSourceTypeExchangeGAL
        case .MobileMe:
            intValue = kABSourceTypeMobileMe
        case .LDAP:
            intValue = kABSourceTypeLDAP
        case .CardDAV:
            intValue = kABSourceTypeCardDAV
        case .CardDAVSearch:
            intValue = kABSourceTypeCardDAVSearch
        }

        return ABSourceType(intValue)
    }

    public init?(rawValue: ABSourceType) {
        switch Int(rawValue) {
        case kABSourceTypeLocal:
            self = .Local
        case kABSourceTypeExchange:
            self = .Exchange
        case kABSourceTypeExchangeGAL:
            self = .ExchangeGAL
        case kABSourceTypeMobileMe:
            self = .MobileMe
        case kABSourceTypeLDAP:
            self = .LDAP
        case kABSourceTypeCardDAV:
            self = .CardDAV
        case kABSourceTypeCardDAVSearch:
            self = .CardDAVSearch
        default:
            return nil
        }
    }

}
