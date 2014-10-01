//
//  Date.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/18/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct Date {

    public struct Labels {
        static let Anniversary: String = kABPersonAnniversaryLabel
    }

    public var dateValue: NSDate

}

extension Date: MultiValueRepresentable {

    public static var multiValueType: PropertyType {
        return .MultiDateTime
    }

    public var multiValueRepresentation: AnyObject {
        return dateValue
    }

    public init?(multiValueRepresentation: AnyObject) {
        if let dateValue = multiValueRepresentation as? NSDate {
            self = Date(dateValue: dateValue)
        } else {
            return nil
        }
    }
    
}

extension Date: DebugPrintable {

    public var debugDescription: String {
        return "\(dateValue)"
    }
    
}