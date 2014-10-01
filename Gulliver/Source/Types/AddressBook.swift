//
//  AddressBook.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/7/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook
import Foundation

public typealias ExternalChangeHandler = GLVExternalChangeHandler
public typealias ExternalChangeToken = GLVExternalChangeToken

public class AddressBook {

    public enum Error: Int {
        case AccessDenied

        private static let domain = "Gullver.AddressBook"

        public var error: NSError {
            return NSError(domain: Error.domain, code: rawValue, userInfo: nil)
        }
    }

    public class var errorDomain: String {
        return Error.domain
    }

    public var addressBookRef: ABAddressBookRef {
        return addressBookStorage!
    }

    private var addressBookStorage: ABAddressBookRef?

    public init?() {
        if let addressBook = ABAddressBookCreateWithOptions(nil, nil) {
            self.addressBookStorage = addressBook.takeRetainedValue()
        } else {
            return nil
        }
    }

    public init(addressBook: ABAddressBookRef) {
        self.addressBookStorage = addressBook
    }

    public class func authorizationStatus() -> AuthorizationStatus {
        return AuthorizationStatus(rawValue: ABAddressBookGetAuthorizationStatus())!
    }

    public class func localizedLabel(label: String) -> String? {
        if let localizedLabel = ABAddressBookCopyLocalizedLabel(label) {
            return localizedLabel.takeRetainedValue()
        } else {
            return nil
        }
    }

    public func requestAccess(completionHandler: ResultHandler?) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, {
            (success: Bool, error: CFErrorRef!) in
            if success {
                completionHandler?(.Success)
            } else {
                completionHandler?(.Failure(error as AnyObject as NSError))
            }
        })
    }

    public var hasUnsavedChanges: Bool {
        return ABAddressBookHasUnsavedChanges(addressBookRef)
    }

    public func save() -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if ABAddressBookSave(addressBookRef, &error) {
            return .Success
        } else {
            return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
        }
    }

    public func registerForExternalChanges(f: ExternalChangeHandler) -> ExternalChangeToken {
        return GLVAddressBookRegisterExternalChangeHandler(addressBookRef, f)
    }

    public func unregisterForExternalChanges(token: ExternalChangeToken) {
        GLVAddressBookUnregisterExternalChangeHandler(addressBookRef, token)
    }

    public func addRecord(record: Record) -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if ABAddressBookAddRecord(addressBookRef, record.recordRef, &error) {
            return .Success
        } else {
            return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
        }
    }

    public func removeRecord(record: Record) -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if ABAddressBookRemoveRecord(addressBookRef, record.recordRef, &error) {
            return .Success
        } else {
            return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
        }
    }

    // MARK: - People

    public var personCount: Int {
        return ABAddressBookGetPersonCount(addressBookRef)
    }

    public func person(recordID: RecordID) -> Person? {
        if let record = ABAddressBookGetPersonWithRecordID(addressBookRef, recordID) {
            return Person(record: record.takeUnretainedValue())
        } else {
            return nil
        }
    }

    public func people(name: String) -> [Person] {
        if let people = ABAddressBookCopyPeopleWithName(addressBookRef, name) {
            let people = people.takeRetainedValue() as [ABRecordRef]
            return people.map({ Person(record: $0) })
        } else {
            return []
        }
    }

    public func allPeople(source: Source) -> [Person] {
        if let people = ABAddressBookCopyArrayOfAllPeopleInSource(addressBookRef, source.recordRef) {
            let people = people.takeRetainedValue() as [ABRecordRef]
            return people.map({ Person(record: $0) })
        } else {
            return []
        }
    }

    public func allPeople(source: Source, sortOrdering: SortOrdering) -> [Person] {
        if let people = ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(addressBookRef, source.recordRef, sortOrdering.rawValue) {
            let people = people.takeRetainedValue() as [ABRecordRef]
            return people.map({ Person(record: $0) })
        } else {
            return []
        }
    }

    // MARK: - Groups

    public var groupCount: Int {
        return ABAddressBookGetGroupCount(addressBookRef)
    }

    public func group(recordID: RecordID) -> Group? {
        if let record = ABAddressBookGetGroupWithRecordID(addressBookRef, recordID) {
            return Group(record: record.takeUnretainedValue())
        } else {
            return nil
        }
    }

    public func allGroups() -> [Group] {
        if let array = ABAddressBookCopyArrayOfAllGroups(addressBookRef) {
            let groups = array.takeRetainedValue() as [ABRecordRef]
            return groups.map({ Group(record: $0) })
        } else {
            return []
        }
    }

    public func allGroups(source: Source) -> [Group] {
        if let groups = ABAddressBookCopyArrayOfAllGroupsInSource(addressBookRef, source.recordRef) {
            let groups = groups.takeRetainedValue() as [ABRecordRef]
            return groups.map({ Group(record: $0) })
        } else {
            return []
        }
    }


    // MARK: - Sources

    public var defaultSource: Source {
        let source: ABRecordRef = ABAddressBookCopyDefaultSource(addressBookRef).takeRetainedValue()
        return Source(record: source)
    }

    public func source(recordID: RecordID) -> Source? {
        if let record = ABAddressBookGetSourceWithRecordID(addressBookRef, recordID) {
            return Source(record: record.takeUnretainedValue())
        } else {
            return nil
        }
    }

    public func allSources() -> [Source] {
        if let array = ABAddressBookCopyArrayOfAllSources(addressBookRef) {
            let sources = array.takeRetainedValue() as [ABRecordRef]
            return sources.map({ Source(record: $0) })
        } else {
            return []
        }
    }

}
