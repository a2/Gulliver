//
//  PhoneNumber.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/18/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct PhoneNumber {

    public struct Labels {
        static let Mobile: String = kABPersonPhoneMobileLabel
        static let IPhone: String = kABPersonPhoneIPhoneLabel
        static let Main: String = kABPersonPhoneMainLabel
        static let HomeFAX: String = kABPersonPhoneHomeFAXLabel
        static let WorkFAX: String = kABPersonPhoneWorkFAXLabel
        static let OtherFAX: String = kABPersonPhoneOtherFAXLabel
        static let Pager: String = kABPersonPhonePagerLabel
    }

    public var stringValue: String

}

extension PhoneNumber: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiString
    }

    public var multiValueRepresentation: AnyObject {
        return stringValue
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let stringValue = multiValueRepresentation as? String {
            self = PhoneNumber(stringValue: stringValue)
        } else {
            return nil
        }
    }
    
}

extension PhoneNumber: Printable {

    public var description: String {
        return stringValue
    }

}

extension PhoneNumber: DebugPrintable {

    public var debugDescription: String {
        return stringValue
    }
    
}