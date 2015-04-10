import AddressBook
import Foundation

extension ABPersonImageFormat: Equatable {}

public func ==(lhs: ABPersonImageFormat, rhs: ABPersonImageFormat) -> Bool {
    return lhs.value == rhs.value
}

extension CFNumberRef: Comparable {}

public func ==(lhs: CFNumberRef, rhs: CFNumberRef) -> Bool {
    return CFNumberCompare(lhs, rhs, nil) == .CompareEqualTo
}

public func <(lhs: CFNumberRef, rhs: CFNumberRef) -> Bool {
    return CFNumberCompare(lhs, rhs, nil) == .CompareLessThan
}
