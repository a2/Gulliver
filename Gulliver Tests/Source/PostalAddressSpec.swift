import AddressBook
import Gulliver
import Nimble
import Quick

class PostalAddressSpec: QuickSpec {
    override func spec() {
        describe("multiValueRepresentation") {
            it("should contain the correct data") {
                let address = PostalAddress(street: "1 Infinite Loop", city: "Cupertino", state: "CA", postalCode: "95014", country: "United States", ISOCountryCode: "US")
                let mvr = address.multiValueRepresentation as! [NSObject : AnyObject]
                expect((mvr[kABPersonAddressStreetKey as String] as! String)) == "1 Infinite Loop"
                expect((mvr[kABPersonAddressCityKey as String] as! String)) == "Cupertino"
                expect((mvr[kABPersonAddressStateKey as String] as! String)) == "CA"
                expect((mvr[kABPersonAddressZIPKey as String] as! String)) == "95014"
                expect((mvr[kABPersonAddressCountryKey as String] as! String)) == "United States"
                expect((mvr[kABPersonAddressCountryCodeKey as String] as! String)) == "US"
            }

            it("is a valid representation") {
                let address = PostalAddress(street: "1 Infinite Loop", city: "Cupertino", state: "CA", postalCode: "95014", country: "United States", ISOCountryCode: "US")

                let multiValue: ABMutableMultiValueRef = ABMultiValueCreateMutable(numericCast(kABDictionaryPropertyType)).takeRetainedValue()
                if !ABMultiValueAddValueAndLabel(multiValue, address.multiValueRepresentation, kABWorkLabel, nil) {
                    fail("Could not add address to multi value")
                }

                let record: ABRecordRef = ABPersonCreate().takeRetainedValue()
                var error: Unmanaged<CFErrorRef>? = nil
                if !ABRecordSetValue(record, kABPersonAddressProperty, multiValue, &error) {
                    let nsError = (error?.takeUnretainedValue()).map { unsafeBitCast($0, NSError.self) }
                    fail("Could not set value on record: \(nsError?.localizedDescription)")
                }
            }
        }

        describe("init(multiValueRepresentation:)") {
            it("creates a valid PostalAddress") {
                let representation: [NSObject : AnyObject] = [
                    kABPersonAddressStreetKey as String: "1 Infinite Loop",
                    kABPersonAddressCityKey as String: "Cupertino",
                    kABPersonAddressStateKey as String: "CA",
                    kABPersonAddressZIPKey as String: "95014",
                    kABPersonAddressCountryKey as String: "United States",
                    kABPersonAddressCountryCodeKey as String: "US",
                ]

                let address = PostalAddress(multiValueRepresentation: representation)
                expect(address).notTo(beNil())
                expect(address!.street) == "1 Infinite Loop"
                expect(address!.city) == "Cupertino"
                expect(address!.state) == "CA"
                expect(address!.postalCode) == "95014"
                expect(address!.country) == "United States"
                expect(address!.ISOCountryCode) == "US"
            }

            it("works with vCard data") {
                let fileURL = NSBundle(forClass: PostalAddressSpec.self).URLForResource("Johnny B. Goode", withExtension: "vcf")!
                let data = NSData(contentsOfURL: fileURL)!
                let records = ABPersonCreatePeopleInSourceWithVCardRepresentation(nil, data as CFDataRef).takeRetainedValue() as [ABRecordRef]
                let multiValue: ABMultiValueRef = ABRecordCopyValue(records[0], kABPersonAddressProperty).takeRetainedValue()

                let values = LabeledValue<PostalAddress>.read(multiValue)
                expect(values[0].label) == kABWorkLabel as String
                expect(values[0].value) == PostalAddress(street: "1 Infinite Loop", city: "Cupertino", state: "CA", postalCode: "95014", country: "United States", ISOCountryCode: nil)
            }
        }
    }
}
