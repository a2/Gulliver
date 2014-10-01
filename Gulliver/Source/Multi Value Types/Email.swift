//
//  Email.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/18/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct Email {

    public var stringValue: String

}

extension Email: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiString
    }

    public var multiValueRepresentation: AnyObject {
        return stringValue
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let stringValue = multiValueRepresentation as? String {
            self = Email(stringValue: stringValue)
        } else {
            return nil
        }
    }

}

extension Email: Printable {

    public var description: String {
        return stringValue
    }

}

extension Email: DebugPrintable {

    public var debugDescription: String {
        return stringValue
    }

}