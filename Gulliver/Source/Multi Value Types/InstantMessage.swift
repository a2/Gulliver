//
//  InstantMessageAddress.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/11/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public struct InstantMessageAddress {

    public struct Services {
        static let Yahoo: String = kABPersonInstantMessageServiceYahoo
        static let Jabber: String = kABPersonInstantMessageServiceJabber
        static let MSN: String = kABPersonInstantMessageServiceMSN
        static let ICQ: String = kABPersonInstantMessageServiceICQ
        static let AIM: String = kABPersonInstantMessageServiceAIM
        static let QQ: String = kABPersonInstantMessageServiceQQ
        static let GoogleTalk: String = kABPersonInstantMessageServiceGoogleTalk
        static let Skype: String = kABPersonInstantMessageServiceSkype
        static let Facebook: String = kABPersonInstantMessageServiceFacebook
        static let GaduGadu: String = kABPersonInstantMessageServiceGaduGadu
    }

    public var service: String?
    public var username: String?

    public init() {

    }

}

extension InstantMessageAddress: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiDictionary
    }

    public var multiValueRepresentation: AnyObject {
        var result = [String : String]()

        if service != nil {
            result[kABPersonInstantMessageServiceKey] = service
        }

        if username != nil {
            result[kABPersonInstantMessageUsernameKey] = username
        }

        return result
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let dictionary = multiValueRepresentation as? [String : String] {
            for (key, value) in dictionary {
                switch key {
                case kABPersonInstantMessageUsernameKey:
                    self.username = value
                case kABPersonInstantMessageServiceKey:
                    self.service = value
                default:
                    break
                }
            }
        } else {
            return nil
        }
    }
    
}

