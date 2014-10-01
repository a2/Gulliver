//
//  RelatedName.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/18/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct RelatedName {

    public struct Labels {
        static let Father: String = kABPersonFatherLabel
        static let Mother: String = kABPersonMotherLabel
        static let Parent: String = kABPersonParentLabel
        static let Brother: String = kABPersonBrotherLabel
        static let Sister: String = kABPersonSisterLabel
        static let Child: String = kABPersonChildLabel
        static let Friend: String = kABPersonFriendLabel
        static let Spouse: String = kABPersonSpouseLabel
        static let Partner: String = kABPersonPartnerLabel
        static let Assistant: String = kABPersonAssistantLabel
        static let Manager: String = kABPersonManagerLabel
    }

    public var stringValue: String

}

extension RelatedName: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiString
    }

    public var multiValueRepresentation: AnyObject {
        return stringValue
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let stringValue = multiValueRepresentation as? String {
            self = RelatedName(stringValue: stringValue)
        } else {
            return nil
        }
    }
    
}

extension RelatedName: Printable {

    public var description: String {
        return stringValue
    }

}

extension RelatedName: DebugPrintable {

    public var debugDescription: String {
        return stringValue
    }

}