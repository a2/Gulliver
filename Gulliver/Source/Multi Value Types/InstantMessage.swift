import AddressBook

public struct InstantMessageAddress: MultiValueRepresentable {
    public struct Services {
        public static let Yahoo = kABPersonInstantMessageServiceYahoo as String
        public static let Jabber = kABPersonInstantMessageServiceJabber as String
        public static let MSN = kABPersonInstantMessageServiceMSN as String
        public static let ICQ = kABPersonInstantMessageServiceICQ as String
        public static let AIM = kABPersonInstantMessageServiceAIM as String
        public static let QQ = kABPersonInstantMessageServiceQQ as String
        public static let GoogleTalk = kABPersonInstantMessageServiceGoogleTalk as String
        public static let Skype = kABPersonInstantMessageServiceSkype as String
        public static let Facebook = kABPersonInstantMessageServiceFacebook as String
        public static let GaduGadu = kABPersonInstantMessageServiceGaduGadu as String
    }

    public var service: String?
    public var username: String?

    public init(service: String? = nil, username: String? = nil) {
        self.service = service
        self.username = username
    }

    public static let multiValueType = PropertyKind.MultiDictionary

    public var multiValueRepresentation: CFTypeRef {
        var result = [NSObject : AnyObject]()

        if let service = service {
            result[kABPersonInstantMessageServiceKey as String] = service
        }

        if let username = username {
            result[kABPersonInstantMessageUsernameKey as String] = username
        }

        return result
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? [NSObject : AnyObject],
            username = dictionary[kABPersonInstantMessageUsernameKey as String] as? String,
            service = dictionary[kABPersonInstantMessageUsernameKey as String] as? String {
                self.init(service: service, username: username)
        }

        return nil
    }
}

