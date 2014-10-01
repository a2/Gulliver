//
//  Person.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public let WorkLabel: String = kABWorkLabel
public let HomeLabel: String = kABHomeLabel
public let OtherLabel: String = kABOtherLabel

public class Person : Record {

    internal override init(record: ABRecordRef) {
        super.init(record: record)
    }

    public convenience init() {
        let person: ABRecordRef = ABPersonCreate().takeRetainedValue()
        self.init(record: person)
    }

    public convenience init(inSource source: Source) {
        let person: ABRecordRef = ABPersonCreateInSource(source.recordRef).takeRetainedValue()
        self.init(record: person)
    }

    public var hasImageData: Bool {
        return ABPersonHasImageData(recordRef)
    }

    public func removeImageData() -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if ABPersonRemoveImageData(recordRef, &error) {
            return .Success
        } else {
            return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
        }
    }

    public func imageData() -> NSData? {
        if let data = ABPersonCopyImageData(recordRef) {
            return data.takeUnretainedValue() as NSData
        } else {
            return nil
        }
    }

    public func imageData(format: ImageFormat) -> NSData? {
        if let data = ABPersonCopyImageDataWithFormat(recordRef, format.rawValue) {
            return data.takeRetainedValue() as NSData
        } else {
            return nil
        }
    }

    public var sortOrdering: SortOrdering {
        return SortOrdering(rawValue: ABPersonGetSortOrdering())!
    }

    public var source: Source {
        let sourceRef: ABRecordRef = ABPersonCopySource(recordRef)!.takeRetainedValue()
        return Source(record: sourceRef)
    }

    public func linkedPeople() -> [Person] {
        let people = ABPersonCopyArrayOfAllLinkedPeople(recordRef)
        let array = people!.takeRetainedValue() as [ABRecordRef]
        return array.map({ Person(record: $0) })
    }

    public var compositeNameFormat: CompositeNameFormat {
        return CompositeNameFormat(rawValue: ABPersonGetCompositeNameFormatForRecord(recordRef))!
    }

    public var compositeNameDelimiter: String {
        return ABPersonCopyCompositeNameDelimiterForRecord(recordRef)!.takeRetainedValue()
    }

    public class func vCardRepresentation(people: [Person]) -> NSData {
        let people = people.map({ $0.recordRef })
        return ABPersonCreateVCardRepresentationWithPeople(people)!.takeRetainedValue() as NSData
    }

    public class func compare(person1: Person, person2: Person, ordering: SortOrdering) -> NSComparisonResult {
        switch ABPersonComparePeopleByName(person1.recordRef, person2.recordRef, ordering.rawValue) {
        case .CompareEqualTo:
            return .OrderedSame
        case .CompareGreaterThan:
            return .OrderedDescending
        case .CompareLessThan:
            return .OrderedAscending
        }
    }

    public class func people(vCardRepresentation: NSData, source: Source?) -> [Person]? {
        let unmanagedPeople: Unmanaged<CFArrayRef>? = ABPersonCreatePeopleInSourceWithVCardRepresentation(source?.recordRef, vCardRepresentation as CFDataRef)
        if unmanagedPeople != nil {
            let people = unmanagedPeople!.takeRetainedValue() as [ABRecordRef]
            return people.map({ Person(record: $0) })
        } else {
            return nil
        }
    }

    public var firstName: String? {
        return value(kABPersonFirstNameProperty)
    }

    public func updateFirstName(newValue: String?) -> Result {
        return setValue(kABPersonFirstNameProperty, newValue)
    }

    public var lastName: String? {
        return value(kABPersonLastNameProperty)
    }

    public func updateLastName(newValue: String?) -> Result {
        return setValue(kABPersonLastNameProperty, newValue)
    }

    public var middleName: String? {
        return value(kABPersonMiddleNameProperty)
    }

    public func updateMiddleName(newValue: String?) -> Result {
        return setValue(kABPersonMiddleNameProperty, newValue)
    }

    public var prefix: String? {
        return value(kABPersonPrefixProperty)
    }

    public func updatePrefix(newValue: String?) -> Result {
        return setValue(kABPersonPrefixProperty, newValue)
    }

    public var suffix: String? {
        return value(kABPersonSuffixProperty)
    }

    public func updateSuffix(newValue: String?) -> Result {
        return setValue(kABPersonSuffixProperty, newValue)
    }

    public var nickname: String? {
        return value(kABPersonNicknameProperty)
    }

    public func updateNickname(newValue: String?) -> Result {
        return setValue(kABPersonNicknameProperty, newValue)
    }

    public var firstNamePhonetic: String? {
        return value(kABPersonFirstNamePhoneticProperty)
    }

    public func updateFirstNamePhonetic(newValue: String?) -> Result {
        return setValue(kABPersonFirstNamePhoneticProperty, newValue)
    }

    public var lastNamePhonetic: String? {
        return value(kABPersonLastNamePhoneticProperty)
    }

    public func updateLastNamePhonetic(newValue: String?) -> Result {
        return setValue(kABPersonLastNamePhoneticProperty, newValue)
    }

    public var middleNamePhonetic: String? {
        return value(kABPersonMiddleNamePhoneticProperty)
    }

    public func updateMiddleNamePhonetic(newValue: String?) -> Result {
        return setValue(kABPersonMiddleNamePhoneticProperty, newValue)
    }

    public var organization: String? {
        return value(kABPersonOrganizationProperty)
    }

    public func updateOrganization(newValue: String?) -> Result {
        return setValue(kABPersonOrganizationProperty, newValue)
    }

    public var jobTitle: String? {
        return value(kABPersonJobTitleProperty)
    }

    public func updateJobTitle(newValue: String?) -> Result {
        return setValue(kABPersonJobTitleProperty, newValue)
    }

    public var department: String? {
        return value(kABPersonDepartmentProperty)
    }

    public func updateDepartment(newValue: String?) -> Result {
        return setValue(kABPersonDepartmentProperty, newValue)
    }

    public var email: MultiValue<Email>? {
        return multiValue(kABPersonEmailProperty)
    }

    public func updateEmail(newValue: MultiValue<Email>?) -> Result {
        return setMultiValue(kABPersonEmailProperty, newValue)
    }

    public var birthday: NSDate? {
        return value(kABPersonBirthdayProperty)
    }

    public func updateBirthday(newValue: NSDate?) -> Result {
        return setValue(kABPersonBirthdayProperty, newValue)
    }

    public var note: String? {
        return value(kABPersonNoteProperty)
    }

    public func updateNote(newValue: String?) -> Result {
        return setValue(kABPersonNoteProperty, newValue)
    }

    public var creationDate: NSDate? {
        return value(kABPersonCreationDateProperty)
    }

    public func updateCreationDate(newValue: NSDate?) -> Result {
        return setValue(kABPersonCreationDateProperty, newValue)
    }

    public var modificationDate: NSDate? {
        return value(kABPersonModificationDateProperty)
    }

    public func updateModificationDate(newValue: NSDate?) -> Result {
        return setValue(kABPersonModificationDateProperty, newValue)
    }

    public var address: MultiValue<PostalAddress>? {
        return multiValue(kABPersonAddressProperty)
    }

    public func updateAddress(newValue: MultiValue<PostalAddress>?) -> Result {
        return setMultiValue(kABPersonAddressProperty, newValue)
    }

    public var dates: MultiValue<Date>? {
        return multiValue(kABPersonDateProperty)
    }

    public func updateDates(newValue: MultiValue<Date>?) -> Result {
        return setMultiValue(kABPersonDateProperty, newValue)
    }

    public var kind: PersonKind {
        let kind: NSNumber = value(kABPersonKindProperty)!
        return PersonKind(rawValue: kind)!
    }

    public func updateKind(newValue: PersonKind) -> Result{
        return setValue(kABPersonKindProperty, newValue.rawValue)
    }

    public var phones: MultiValue<PhoneNumber>? {
        return multiValue(kABPersonPhoneProperty)
    }

    public func updatePhones(newValue: MultiValue<PhoneNumber>?) -> Result {
        return setMultiValue(kABPersonPhoneProperty, newValue)
    }

    public var instantMessages: MultiValue<InstantMessageAddress>? {
        return multiValue(kABPersonInstantMessageProperty)
    }

    public func updateInstantMessages(newValue: MultiValue<InstantMessageAddress>?) -> Result {
        return setMultiValue(kABPersonInstantMessageProperty, newValue)
    }

    public var URLs: MultiValue<URL>? {
        return multiValue(kABPersonURLProperty)
    }

    public func updateURLs(newValue: MultiValue<URL>?) -> Result {
        return setMultiValue(kABPersonURLProperty, newValue)
    }

    public var relatedNames: MultiValue<RelatedName>? {
        return multiValue(kABPersonRelatedNamesProperty)
    }

    public func updateRelatedNames(newValue: MultiValue<RelatedName>?) -> Result {
        return setMultiValue(kABPersonRelatedNamesProperty, newValue)
    }

    public var socialProfiles: MultiValue<SocialProfile>? {
        return multiValue(kABPersonSocialProfileProperty)
    }

    public func updateSocialProfiles(newValue: MultiValue<SocialProfile>?) -> Result {
        return setMultiValue(kABPersonSocialProfileProperty, newValue)
    }

    public var alternateBirthdays: MultiValue<AlternateBirthday>? {
        return multiValue(kABPersonAlternateBirthdayProperty)
    }
    
    public func updateAlternateBirthdays(newValue: MultiValue<AlternateBirthday>?) -> Result {
        return setMultiValue(kABPersonAlternateBirthdayProperty, newValue)
    }

}
