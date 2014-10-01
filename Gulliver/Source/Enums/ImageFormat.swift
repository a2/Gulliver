//
//  ImageFormat.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import AddressBook

public enum ImageFormat {
    case Thumbnail
    case OriginalSize
}

extension ImageFormat: RawRepresentable {

    public var rawValue: ABPersonImageFormat {
        switch self {
        case .Thumbnail:
            return kABPersonImageFormatThumbnail
        case .OriginalSize:
            return kABPersonImageFormatOriginalSize
        }
    }

    public init?(rawValue: ABPersonImageFormat) {
        switch rawValue {
        case let x where x.value == kABPersonImageFormatThumbnail.value:
            self = .Thumbnail
        case let x where x.value == kABPersonImageFormatOriginalSize.value:
            self = .OriginalSize
        default:
            return nil
        }
    }

}
