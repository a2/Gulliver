import AddressBook

public struct InstantMessageAddress: MultiValueRepresentable {
    public struct Services {
        static let Yahoo = String(kABPersonInstantMessageServiceYahoo)
        static let Jabber = String(kABPersonInstantMessageServiceJabber)
        static let MSN = String(kABPersonInstantMessageServiceMSN)
        static let ICQ = String(kABPersonInstantMessageServiceICQ)
        static let AIM = String(kABPersonInstantMessageServiceAIM)
        static let QQ = String(kABPersonInstantMessageServiceQQ)
        static let GoogleTalk = String(kABPersonInstantMessageServiceGoogleTalk)
        static let Skype = String(kABPersonInstantMessageServiceSkype)
        static let Facebook = String(kABPersonInstantMessageServiceFacebook)
        static let GaduGadu = String(kABPersonInstantMessageServiceGaduGadu)
    }

    public var service: String?
    public var username: String?

    public init(service: String? = nil, username: String? = nil) {
        self.service = service
        self.username = username
    }

    public static let multiValueType = PropertyKind.MultiDictionary

    public var multiValueRepresentation: CFTypeRef {
        var result = [String : String]()

        if let service = service {
            result[String(kABPersonInstantMessageServiceKey)] = service
        }

        if let username = username {
            result[String(kABPersonInstantMessageUsernameKey)] = username
        }

        return result
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let dictionary = multiValueRepresentation as? [String : String] {
            for (key, value) in dictionary {
                switch key {
                case String(kABPersonInstantMessageUsernameKey):
                    self.username = value
                case String(kABPersonInstantMessageServiceKey):
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

