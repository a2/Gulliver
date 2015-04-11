import AddressBook

public struct InstantMessageAddress: MultiValueRepresentable {
    public struct Services {
        static let Yahoo = kABPersonInstantMessageServiceYahoo as String
        static let Jabber = kABPersonInstantMessageServiceJabber as String
        static let MSN = kABPersonInstantMessageServiceMSN as String
        static let ICQ = kABPersonInstantMessageServiceICQ as String
        static let AIM = kABPersonInstantMessageServiceAIM as String
        static let QQ = kABPersonInstantMessageServiceQQ as String
        static let GoogleTalk = kABPersonInstantMessageServiceGoogleTalk as String
        static let Skype = kABPersonInstantMessageServiceSkype as String
        static let Facebook = kABPersonInstantMessageServiceFacebook as String
        static let GaduGadu = kABPersonInstantMessageServiceGaduGadu as String
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

