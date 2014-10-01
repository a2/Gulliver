//
//  Source.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public class Source : Record {

    public var name: String? {
        return value(kABSourceNameProperty)
    }

    public func updateName(newValue: String?) -> Result {
        return setValue(kABSourceNameProperty, newValue)
    }

    public var sourceType: SourceType {
        let kind: NSNumber = value(kABSourceNameProperty)!
        return SourceType(rawValue: ABSourceType(kind.integerValue))!
    }

}
