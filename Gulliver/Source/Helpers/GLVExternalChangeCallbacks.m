//
//  GLVExternalChangeCallbacks.m
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

#import "GLVExternalChangeCallbacks.h"

// [NSValue<ABAddressBookRef>: [NSValue<Block>: Block]]
static NSMutableDictionary *GLVChangeBlocksForAddressBook(ABAddressBookRef addressBook) {
    NSCParameterAssert(addressBook != NULL);

    static NSMutableDictionary *dictionary;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dictionary = [NSMutableDictionary dictionary];
    });

    id key = [NSValue valueWithPointer:addressBook];
    NSMutableDictionary *changeBlocks = dictionary[key];
    if (!changeBlocks) {
        dictionary[key] = changeBlocks = [NSMutableDictionary dictionary];
    }

    return changeBlocks;
}

static void GLVExternalChangeBlockCallback(ABAddressBookRef addressBook, CFDictionaryRef info, void *context) {
    GLVExternalChangeHandler block = (__bridge GLVExternalChangeHandler)context;
    if (block) block(addressBook, (__bridge NSDictionary *)info);
}

GLVExternalChangeToken GLVAddressBookRegisterExternalChangeHandler(ABAddressBookRef addressBook, GLVExternalChangeHandler handler) {
    if (addressBook == NULL || handler == nil) {
        return [NSValue valueWithNonretainedObject:nil];
    }

    handler = [handler copy];

    NSValue *token = [NSValue valueWithNonretainedObject:handler];
    GLVChangeBlocksForAddressBook(addressBook)[token] = handler;

    ABAddressBookRegisterExternalChangeCallback(addressBook, GLVExternalChangeBlockCallback, (__bridge void *)handler);

    return token;
}

void GLVAddressBookUnregisterExternalChangeHandler(ABAddressBookRef addressBook, GLVExternalChangeToken token) {
    if (addressBook == NULL || token == nil) {
        return;
    }

    NSMutableDictionary *changeBlocks = GLVChangeBlocksForAddressBook(addressBook);
    if (changeBlocks[token]) {
        [changeBlocks removeObjectForKey:token];

        NSValue *tokenAsValue = (NSValue *)token;
        NSCParameterAssert([token isKindOfClass:[NSValue class]]);
        ABAddressBookUnregisterExternalChangeCallback(addressBook, GLVExternalChangeBlockCallback, tokenAsValue.pointerValue);
    }
}
