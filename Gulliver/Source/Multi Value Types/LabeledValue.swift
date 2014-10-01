//
//  LabeledValue.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/17/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public struct LabeledValue<T> {

    var label: String
    var value: T

}

extension LabeledValue: Printable {

    public var description: String {
        return "\(label): \(value)"
    }

}

extension LabeledValue: DebugPrintable {

    public var debugDescription: String {
        return description
    }

}