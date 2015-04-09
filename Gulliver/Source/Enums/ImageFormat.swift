import AddressBook

public enum ImageFormat: RawRepresentable{
    case Thumbnail
    case OriginalSize

    public var rawValue: ABPersonImageFormat {
        switch self {
        case .Thumbnail:
            return kABPersonImageFormatThumbnail
        case .OriginalSize:
            return kABPersonImageFormatOriginalSize
        }
    }

    public init?(rawValue: ABPersonImageFormat) {
        switch rawValue.value {
        case kABPersonImageFormatThumbnail.value:
            self = .Thumbnail
        case kABPersonImageFormatOriginalSize.value:
            self = .OriginalSize
        default:
            return nil
        }
    }
}
