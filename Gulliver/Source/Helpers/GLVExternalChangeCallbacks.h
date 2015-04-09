@import AddressBook;
@import Foundation;

typedef void (^GLVExternalChangeHandler)(ABAddressBookRef __nonnull addressBook, NSDictionary *__nullable info);
typedef id<NSObject, NSCopying> GLVExternalChangeToken;

extern __nonnull GLVExternalChangeToken GLVAddressBookRegisterExternalChangeHandler(ABAddressBookRef __nonnull addressBook, GLVExternalChangeHandler __nonnull handler);

extern void GLVAddressBookUnregisterExternalChangeHandler(ABAddressBookRef __nonnull addressBook, GLVExternalChangeToken __nonnull token);
