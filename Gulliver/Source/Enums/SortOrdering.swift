//
//  SortOrdering.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum SortOrdering {
    case ByFirstName
    case ByLastName
}

extension SortOrdering: RawRepresentable {

    public var rawValue: ABPersonSortOrdering {
        switch self {
        case .ByFirstName:
            return ABPersonSortOrdering(kABPersonSortByFirstName)
        case .ByLastName:
            return ABPersonSortOrdering(kABPersonSortByLastName)
        }
    }

    public init?(rawValue: ABPersonSortOrdering) {
        switch rawValue {
        case let x where Int(x) == kABPersonSortByFirstName:
            self = .ByFirstName
        case let x where Int(x) == kABPersonSortByLastName:
            self = .ByLastName
        default:
            return nil
        }
    }

}