//
//  SocialProfile.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/11/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct SocialProfile {

    public struct Labels {
        static let Twitter: String = kABPersonSocialProfileServiceTwitter
        static let SinaWeibo: String = kABPersonSocialProfileServiceSinaWeibo
        static let GameCenter: String = kABPersonSocialProfileServiceGameCenter
        static let Facebook: String = kABPersonSocialProfileServiceFacebook
        static let Myspace: String = kABPersonSocialProfileServiceMyspace
        static let LinkedIn: String = kABPersonSocialProfileServiceLinkedIn
        static let Flickr: String = kABPersonSocialProfileServiceFlickr
    }

    public var URL: String
    public var service: String?
    public var username: String?
    public var userIdentifier: String?

    public init(URL: String) {
        self.URL = URL
    }

}

extension SocialProfile: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiDictionary
    }

    public var multiValueRepresentation: AnyObject {
        var result = [String : String]()
        result[kABPersonSocialProfileURLKey] = URL

        if service != nil {
            result[kABPersonSocialProfileServiceKey] = service
        }

        if username != nil {
            result[kABPersonSocialProfileUsernameKey] = username
        }

        if userIdentifier != nil {
            result[kABPersonSocialProfileUserIdentifierKey] = userIdentifier
        }

        return result
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let dictionary = multiValueRepresentation as? [String : String] {
            if let URL = dictionary[kABPersonSocialProfileURLKey] {
                self.URL = URL
            } else {
                return nil
            }

            for (key, value) in dictionary {
                switch key {
                case kABPersonSocialProfileServiceKey:
                    self.service = value
                case kABPersonSocialProfileUsernameKey:
                    self.username = value
                case kABPersonSocialProfileUserIdentifierKey:
                    self.userIdentifier = value
                default:
                    break
                }
            }
        } else {
            return nil
        }
    }
    
}