#import "GLVExternalChangeCallbacks.h"

static void GLVExternalChangeBlockCallback(ABAddressBookRef __nonnull addressBook, CFDictionaryRef __nullable info, void *__nonnull context)
{
    GLVExternalChangeHandler block = (__bridge GLVExternalChangeHandler)context;
    block(addressBook, (__bridge NSDictionary *)info);
}

GLVExternalChangeToken GLVAddressBookRegisterExternalChangeHandler(__nonnull ABAddressBookRef addressBook, __nonnull GLVExternalChangeHandler handler)
{
    handler = [handler copy];
    ABAddressBookRegisterExternalChangeCallback(addressBook, GLVExternalChangeBlockCallback, (__bridge void *)handler);
    return handler;
}

void GLVAddressBookUnregisterExternalChangeHandler(__nonnull ABAddressBookRef addressBook, __nonnull GLVExternalChangeToken token)
{
    ABAddressBookUnregisterExternalChangeCallback(addressBook, GLVExternalChangeBlockCallback, (__bridge void *)token);
}
