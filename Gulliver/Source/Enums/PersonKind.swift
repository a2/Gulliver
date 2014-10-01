//
//  PersonKind.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/11/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum PersonKind {
    case Person
    case Organization
}

extension PersonKind: RawRepresentable {

    public var rawValue: CFNumberRef {
        switch self {
        case .Person:
            return kABPersonKindPerson
        case .Organization:
            return kABPersonKindOrganization
        }
    }

    public init?(rawValue: CFNumberRef) {
        switch rawValue {
        case let x where CFNumberCompare(x, kABPersonKindPerson, nil) == CFComparisonResult.CompareEqualTo:
            self = .Person
        case let x where CFNumberCompare(x, kABPersonKindOrganization, nil) == CFComparisonResult.CompareEqualTo:
            self = .Organization
        default:
            return nil
        }
   }

}
