@import AddressBook;
@import Foundation;

static void GLVLoadAddressBookConstants(void) __attribute__((constructor));
static void GLVLoadAddressBookConstants(void) {
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    if (addressBook) CFRelease(addressBook);
}
