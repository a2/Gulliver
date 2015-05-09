@import AddressBook;

typedef void (^ExternalChangeHandler)(NSDictionary *__nullable info);
typedef void (^RemovalToken)(void);

static void _GLVAddressBookExternalChangesCallback(ABAddressBookRef addressBook, CFDictionaryRef info, void *context)
{
    ExternalChangeHandler block = (__bridge ExternalChangeHandler)context;
    block((__bridge NSDictionary *)info);
}

__attribute__((used, visibility("hidden"))) __nonnull RemovalToken _GLVAddressBookRegisterExternalChangeHandler(__nonnull ABAddressBookRef addressBook, __nonnull ExternalChangeHandler handler)
{
    ABAddressBookRegisterExternalChangeCallback(addressBook, _GLVAddressBookExternalChangesCallback, (__bridge void *)handler);

    __block dispatch_once_t onceToken;
    RemovalToken token = ^{
        dispatch_once(&onceToken, ^{
            ABAddressBookUnregisterExternalChangeCallback(addressBook, _GLVAddressBookExternalChangesCallback, (__bridge void *)handler);
        });
    };
    return [token copy];
}
