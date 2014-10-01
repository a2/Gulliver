//
//  CompositeNameFormat.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum CompositeNameFormat {
    case FirstNameFirst
    case LastNameFirst
}

extension CompositeNameFormat: RawRepresentable {

    public var rawValue: ABPersonCompositeNameFormat {
        switch self {
        case .FirstNameFirst:
            return ABPersonCompositeNameFormat(kABPersonCompositeNameFormatFirstNameFirst)
        case .LastNameFirst:
            return ABPersonCompositeNameFormat(kABPersonCompositeNameFormatLastNameFirst)
        }
    }

    public init?(rawValue: ABPersonCompositeNameFormat) {
        switch rawValue {
        case UInt32(kABPersonCompositeNameFormatFirstNameFirst):
            self = .FirstNameFirst
        case UInt32(kABPersonCompositeNameFormatLastNameFirst):
            self = .LastNameFirst
        default:
            return nil
        }
    }

}
