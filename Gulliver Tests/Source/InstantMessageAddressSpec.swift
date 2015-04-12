import AddressBook
import Gulliver
import Nimble
import Quick

class InstantMessageAddressSpec: QuickSpec {
    override func spec() {
        describe("multiValueRepresentation") {
            it("should contain the correct data") {
                let address = InstantMessageAddress(service: InstantMessageAddress.Services.Facebook, username: "a2")
                let mvr = address.multiValueRepresentation as! [NSObject : AnyObject]
                expect((mvr[kABPersonInstantMessageServiceKey as String] as! String)) == kABPersonInstantMessageServiceFacebook as String
                expect((mvr[kABPersonInstantMessageUsernameKey as String] as! String)) == "a2"
            }

            it("is a valid representation") {
                let address = InstantMessageAddress(service: InstantMessageAddress.Services.Facebook, username: "a2")

                let multiValue: ABMutableMultiValueRef = ABMultiValueCreateMutable(numericCast(kABDictionaryPropertyType)).takeRetainedValue()
                if !ABMultiValueAddValueAndLabel(multiValue, address.multiValueRepresentation, "facebook", nil) {
                    fail("Could not add address to multi value")
                }

                let record: ABRecordRef = ABPersonCreate().takeRetainedValue()
                var error: Unmanaged<CFErrorRef>? = nil
                if !ABRecordSetValue(record, kABPersonInstantMessageProperty, multiValue, &error) {
                    let nsError = (error?.takeUnretainedValue()).map { unsafeBitCast($0, NSError.self) }
                    fail("Could not set value on record: \(nsError?.localizedDescription)")
                }
            }
        }

        describe("init(multiValueRepresentation:)") {
            it("creates a valid InstantMessageAddress") {
                let representation: [NSObject : AnyObject] = [
                    kABPersonInstantMessageServiceKey as String: kABPersonInstantMessageServiceFacebook as String,
                    kABPersonInstantMessageUsernameKey as String: "a2",
                ]

                let address = InstantMessageAddress(multiValueRepresentation: representation)
                expect(address).notTo(beNil())
                expect(address!.service) == InstantMessageAddress.Services.Facebook
                expect(address!.username) == "a2"
            }

            it("works with vCard data") {
                let fileURL = NSBundle(forClass: AlternateBirthdaySpec.self).URLForResource("Johnny B. Goode", withExtension: "vcf")!
                let data = NSData(contentsOfURL: fileURL)!
                let records = ABPersonCreatePeopleInSourceWithVCardRepresentation(nil, data as CFDataRef).takeRetainedValue() as [ABRecordRef]
                let multiValue: ABMultiValueRef = ABRecordCopyValue(records[0], kABPersonInstantMessageProperty).takeRetainedValue()

                let values = LabeledValue<InstantMessageAddress>.read(multiValue)
                expect(values[0].label) == "facebook"
                expect(values[0].value) == InstantMessageAddress(service: InstantMessageAddress.Services.Facebook, username: "a2")
                expect(values[1].label) == "skype"
                expect(values[1].value) == InstantMessageAddress(service: InstantMessageAddress.Services.Skype, username: "pandamonia289")
            }
        }
    }
}
