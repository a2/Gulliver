//
//  AuthorizationStatus.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum AuthorizationStatus {
    case NotDetermined
    case Restricted
    case Denied
    case Authorized
}

extension AuthorizationStatus: RawRepresentable {

    public var rawValue: ABAuthorizationStatus {
        switch self {
        case .NotDetermined:
            return .NotDetermined
        case .Restricted:
            return .Restricted
        case .Denied:
            return .Denied
        case .Authorized:
            return .Authorized
        }
    }

    public init?(rawValue: ABAuthorizationStatus) {
        switch rawValue {
        case .NotDetermined:
            self = .NotDetermined
        case .Restricted:
            self = .Restricted
        case .Denied:
            self = .Denied
        case .Authorized:
            self = .Authorized
        }
    }

}