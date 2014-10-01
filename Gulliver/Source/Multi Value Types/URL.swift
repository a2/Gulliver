//
//  URL.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/18/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct URL {

    public struct Labels {
        static let HomePage: String = kABPersonHomePageLabel
    }

    public var stringValue: String

}

extension URL: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiString
    }

    public var multiValueRepresentation: AnyObject {
        return stringValue
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let stringValue = multiValueRepresentation as? String {
            self = URL(stringValue: stringValue)
        } else {
            return nil
        }
    }
    
}

extension URL: Printable {

    public var description: String {
        return stringValue
    }

}

extension URL: DebugPrintable {

    public var debugDescription: String {
        return stringValue
    }
    
}
