//
//  Record.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook
import Foundation

public typealias RecordID = ABRecordID

public class Record {

    public let recordRef: ABRecordRef

    internal init(record: ABRecordRef) {
        self.recordRef = record
    }

    public var recordID: RecordID {
        return ABRecordGetRecordID(recordRef)
    }

    private func genericValue<T>(property: ABPropertyID) -> T? {
        if let value = ABRecordCopyValue(recordRef, property) {
            return value.takeRetainedValue() as? T
        }

        return nil
    }

    public func value(property: ABPropertyID) -> String? {
        return genericValue(property)
    }

    public func value(property: ABPropertyID) -> NSDate? {
        return genericValue(property)
    }

    public func value(property: ABPropertyID) -> NSNumber? {
        return genericValue(property)
    }

    func multiValue<T: MultiValueRepresentable where T.MultiValueType == CFTypeRef>(property: ABPropertyID) -> MultiValue<T>? {
        if let value = ABRecordCopyValue(recordRef, property) {
            let multiValue: ABMultiValueRef = value.takeRetainedValue()
            return MultiValue<T>(multiValue: multiValue)
        }

        return nil
    }

    private func setGenericValue(property: ABPropertyID, _ newValue: AnyObject?) -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if newValue != nil {
            if ABRecordSetValue(recordRef, property, newValue, &error) {
                return .Success
            }
        } else {
            if ABRecordRemoveValue(recordRef, property, &error) {
                return .Success
            }
        }

        return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
    }

    public func setValue(property: ABPropertyID, _ newValue: String?) -> Result {
        return setGenericValue(property, newValue)
    }

    public func setValue(property: ABPropertyID, _ newValue: NSDate?) -> Result {
        return setGenericValue(property, newValue)
    }

    public func setValue(property: ABPropertyID, _ newValue: NSNumber?) -> Result {
        return setGenericValue(property, newValue)
    }

    public func setMultiValue<T: MultiValueRepresentable where T.MultiValueType == CFTypeRef>(property: ABPropertyID, _ newValue: MultiValue<T>?) -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if newValue != nil {
            if ABRecordSetValue(recordRef, property, newValue!.multiValueRef(), &error) {
                return .Success
            }
        } else {
            if ABRecordRemoveValue(recordRef, property, &error) {
                return .Success
            }
        }

        return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
    }

}
