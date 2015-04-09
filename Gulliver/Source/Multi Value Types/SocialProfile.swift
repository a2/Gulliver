import AddressBook

public struct SocialProfile: MultiValueRepresentable {
    public struct Labels {
        public static let Twitter = kABPersonSocialProfileServiceTwitter as String
        public static let SinaWeibo = kABPersonSocialProfileServiceSinaWeibo as String
        public static let GameCenter = kABPersonSocialProfileServiceGameCenter as String
        public static let Facebook = kABPersonSocialProfileServiceFacebook as String
        public static let Myspace = kABPersonSocialProfileServiceMyspace as String
        public static let LinkedIn = kABPersonSocialProfileServiceLinkedIn as String
        public static let Flickr = kABPersonSocialProfileServiceFlickr as String
    }

    public var URL: String
    public var service: String?
    public var username: String?
    public var userIdentifier: String?

    public init(URL: String, service: String? = nil, username: String? = nil, userIdentifier: String? = nil) {
        self.URL = URL
        self.service = service
        self.username = username
        self.userIdentifier = userIdentifier
    }

    public static let multiValueType = PropertyKind.MultiDictionary

    public var multiValueRepresentation: CFTypeRef {
        var result = [String : String]()
        result[kABPersonSocialProfileURLKey as String] = URL

        if let service = service {
            result[kABPersonSocialProfileServiceKey as String] = service
        }

        if let username = username {
            result[kABPersonSocialProfileUsernameKey as String] = username
        }

        if let userIdentifier = userIdentifier {
            result[kABPersonSocialProfileUserIdentifierKey as String] = userIdentifier
        }

        return result
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? [String : String] {
            if let URL = dictionary[kABPersonSocialProfileURLKey as String] {
                self.URL = URL
            } else {
                return nil
            }

            for (key, value) in dictionary {
                switch key {
                case kABPersonSocialProfileServiceKey as! String:
                    self.service = value
                case kABPersonSocialProfileUsernameKey as! String:
                    self.username = value
                case kABPersonSocialProfileUserIdentifierKey as! String:
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