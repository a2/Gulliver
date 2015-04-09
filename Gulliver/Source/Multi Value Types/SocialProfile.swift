import AddressBook

public struct SocialProfile: MultiValueRepresentable {
    public struct Labels {
        public static let Twitter = String(kABPersonSocialProfileServiceTwitter)
        public static let SinaWeibo = String(kABPersonSocialProfileServiceSinaWeibo)
        public static let GameCenter = String(kABPersonSocialProfileServiceGameCenter)
        public static let Facebook = String(kABPersonSocialProfileServiceFacebook)
        public static let Myspace = String(kABPersonSocialProfileServiceMyspace)
        public static let LinkedIn = String(kABPersonSocialProfileServiceLinkedIn)
        public static let Flickr = String(kABPersonSocialProfileServiceFlickr)
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
        result[String(kABPersonSocialProfileURLKey)] = URL

        if let service = service {
            result[String(kABPersonSocialProfileServiceKey)] = service
        }

        if let username = username {
            result[String(kABPersonSocialProfileUsernameKey)] = username
        }

        if let userIdentifier = userIdentifier {
            result[String(kABPersonSocialProfileUserIdentifierKey)] = userIdentifier
        }

        return result
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? [String : String] {
            if let URL = dictionary[String(kABPersonSocialProfileURLKey)] {
                self.URL = URL
            } else {
                return nil
            }

            for (key, value) in dictionary {
                switch key {
                case String(kABPersonSocialProfileServiceKey):
                    self.service = value
                case String(kABPersonSocialProfileUsernameKey):
                    self.username = value
                case String(kABPersonSocialProfileUserIdentifierKey):
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