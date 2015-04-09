import AddressBook
import AddressBookUI

public struct PostalAddress: DebugPrintable, MultiValueRepresentable, Printable {
    public var street: String?
    public var city: String?
    public var state: String?
    public var ZIP: String?
    public var country: String?
    public var countryCode: String?
    public var otherFields = [String : String]()

    public init(street: String? = nil, city: String? = nil, state: String? = nil, ZIP: String? = nil, country: String? = nil, countryCode: String? = nil, otherFields: [String : String] = [:]) {
        self.street = street
        self.city = city
        self.state = state
        self.ZIP = ZIP
        self.country = country
        self.countryCode = countryCode
        self.otherFields = otherFields
    }

    public static let multiValueType = PropertyKind.MultiDictionary

    public var multiValueRepresentation: CFTypeRef {
        var result = otherFields

        if let street = street {
            result[String(kABPersonAddressStreetKey)] = street
        }

        if let city = city {
            result[String(kABPersonAddressCityKey)] = city
        }

        if let state = state {
            result[String(kABPersonAddressStateKey)] = state
        }

        if let ZIP = ZIP {
            result[String(kABPersonAddressZIPKey)] = ZIP
        }

        if let country = country {
            result[String(kABPersonAddressCountryKey)] = country
        }

        if let countryCode = countryCode {
            result[String(kABPersonAddressCountryCodeKey)] = countryCode
        }

        return result
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let multiValueRepresentation = multiValueRepresentation as? [String : String] {
            for (key, value) in multiValueRepresentation {
                switch key {
                case String(kABPersonAddressStreetKey):
                    self.street = value
                case String(kABPersonAddressCityKey):
                    self.city = value
                case String(kABPersonAddressStateKey):
                    self.state = value
                case String(kABPersonAddressZIPKey):
                    self.ZIP = value
                case String(kABPersonAddressCountryKey):
                    self.country = value
                case String(kABPersonAddressCountryCodeKey):
                    self.countryCode = value
                default:
                    self.otherFields[key] = value
                }
            }
        } else {
            return nil
        }
    }

    public var description: String {
        let address = multiValueRepresentation as! [NSObject : AnyObject]
        return ABCreateStringWithAddressDictionary(address, true)
    }

    public var debugDescription: String {
        return toDebugString(multiValueRepresentation)
    }
}
