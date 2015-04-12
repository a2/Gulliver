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

    public init(street: String?, city: String?, state: String?, ZIP: String?, country: String?, countryCode: String?, otherFields: [String : String] = [:]) {
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
            result[kABPersonAddressStreetKey as String] = street
        }

        if let city = city {
            result[kABPersonAddressCityKey as String] = city
        }

        if let state = state {
            result[kABPersonAddressStateKey as String] = state
        }

        if let ZIP = ZIP {
            result[kABPersonAddressZIPKey as String] = ZIP
        }

        if let country = country {
            result[kABPersonAddressCountryKey as String] = country
        }

        if let countryCode = countryCode {
            result[kABPersonAddressCountryCodeKey as String] = countryCode
        }

        return result
    }

    public init?(multiValueRepresentation: CFTypeRef) {
        if let multiValueRepresentation = multiValueRepresentation as? [String : String] {
            for (key, value) in multiValueRepresentation {
                switch key {
                case kABPersonAddressStreetKey as! String:
                    self.street = value
                case kABPersonAddressCityKey as! String:
                    self.city = value
                case kABPersonAddressStateKey as! String:
                    self.state = value
                case kABPersonAddressZIPKey as! String:
                    self.ZIP = value
                case kABPersonAddressCountryKey as! String:
                    self.country = value
                case kABPersonAddressCountryCodeKey as! String:
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
