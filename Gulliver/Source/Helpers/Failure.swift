import Foundation
import Lustre

func failure<Result: _ResultType>(error: CFErrorRef) -> Result {
    return Result(failure: unsafeBitCast(error, NSError.self))
}
