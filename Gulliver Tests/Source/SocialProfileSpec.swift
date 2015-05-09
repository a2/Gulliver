import AddressBook
import Gulliver
import Nimble
import Quick

class SocialProfileSpec: QuickSpec {
    override func spec() {
        describe("multiValueRepresentation") {
            it("should contain the correct data") {
                let profile = SocialProfile(URL: "http://twitter.com/jbgoode", service: SocialProfile.Services.Twitter, username: "@jbgoode", userIdentifier: nil)
                let mvr = profile.multiValueRepresentation as! [NSObject : AnyObject]
                expect((mvr[kABPersonSocialProfileURLKey as String] as! String)) == "http://twitter.com/jbgoode"
                expect((mvr[kABPersonSocialProfileServiceKey as String] as! String)) == kABPersonSocialProfileServiceTwitter as String
                expect((mvr[kABPersonSocialProfileUsernameKey as String] as! String)) == "@jbgoode"
                expect(mvr[kABPersonSocialProfileUserIdentifierKey as String]).to(beNil())
            }

            it("is a valid representation") {
                let profile = SocialProfile(URL: "http://twitter.com/jbgoode", service: SocialProfile.Services.Twitter, username: "@jbgoode", userIdentifier: nil)

                let multiValue: ABMutableMultiValueRef = ABMultiValueCreateMutable(numericCast(kABDictionaryPropertyType)).takeRetainedValue()
                if !ABMultiValueAddValueAndLabel(multiValue, profile.multiValueRepresentation, kABWorkLabel, nil) {
                    fail("Could not add profile to multi value")
                }

                let record: ABRecordRef = ABPersonCreate().takeRetainedValue()
                var error: Unmanaged<CFErrorRef>? = nil
                if !ABRecordSetValue(record, kABPersonSocialProfileProperty, multiValue, &error) {
                    let nsError = (error?.takeUnretainedValue()).map { unsafeBitCast($0, NSError.self) }
                    fail("Could not set value on record: \(nsError?.localizedDescription)")
                }
            }
        }

        describe("init(multiValueRepresentation:)") {
            it("creates a valid SocialProfile") {
                let representation: [NSObject : AnyObject] = [
                    kABPersonSocialProfileURLKey as String: "http://twitter.com/jbgoode",
                    kABPersonSocialProfileServiceKey as String: kABPersonSocialProfileServiceTwitter as String,
                    kABPersonSocialProfileUsernameKey as String: "@jbgoode",
                ]

                let profile = SocialProfile(multiValueRepresentation: representation)
                expect(profile).notTo(beNil())
                expect(profile!.URL) == "http://twitter.com/jbgoode"
                expect(profile!.service) == SocialProfile.Services.Twitter
                expect(profile!.username) == "@jbgoode"
            }

            it("works with vCard data") {
                let fileURL = NSBundle(forClass: PostalAddressSpec.self).URLForResource("Johnny B. Goode", withExtension: "vcf")!
                let data = NSData(contentsOfURL: fileURL)!
                let records = ABPersonCreatePeopleInSourceWithVCardRepresentation(nil, data as CFDataRef).takeRetainedValue() as [ABRecordRef]
                let multiValue: ABMultiValueRef = ABRecordCopyValue(records[0], kABPersonSocialProfileProperty).takeRetainedValue()

                let values = LabeledValue<SocialProfile>.read(multiValue)
                expect(values[0].label) == kABWorkLabel as String
                expect(values[0].value) == SocialProfile(URL: "http://twitter.com/jbgoode", service: SocialProfile.Services.Twitter, username: "jbgoode", userIdentifier: nil)
                expect(values[1].label) == kABWorkLabel as String
                expect(values[1].value) == SocialProfile(URL: "http://facebook.com/johnny.b.goode", service: SocialProfile.Services.Facebook, username: "johnny.b.goode", userIdentifier: nil)
            }
        }
    }
}
