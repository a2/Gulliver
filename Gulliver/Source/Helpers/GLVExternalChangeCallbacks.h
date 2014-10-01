//
//  GLVExternalChangeCallbacks.h
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

@import AddressBook;
@import Foundation;

typedef void (^GLVExternalChangeHandler)(ABAddressBookRef addressBook, NSDictionary *info);
typedef id<NSObject, NSCopying> GLVExternalChangeToken;

extern GLVExternalChangeToken GLVAddressBookRegisterExternalChangeHandler(ABAddressBookRef addressBook, GLVExternalChangeHandler handler);

extern void GLVAddressBookUnregisterExternalChangeHandler(ABAddressBookRef addressBook, GLVExternalChangeToken token);
