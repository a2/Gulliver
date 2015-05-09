import AddressBook
import Gulliver
import Nimble
import Quick

class ImageFormatSpec: QuickSpec {
    override func spec() {
        describe("Thumbnail") {
            it("has the correct rawValue") {
                expect(ImageFormat.Thumbnail.rawValue) == kABPersonImageFormatThumbnail
            }

            it("can be created with an ABPersonImageFormat value") {
                let format = ImageFormat(rawValue: kABPersonImageFormatThumbnail)
                expect(format).notTo(beNil())
                expect(format) == ImageFormat.Thumbnail
            }
        }

        describe("OriginalSize") {
            it("has the correct rawValue") {
                expect(ImageFormat.OriginalSize.rawValue) == kABPersonImageFormatOriginalSize
            }

            it("can be created with an ABPersonImageFormat value") {
                let format = ImageFormat(rawValue: kABPersonImageFormatOriginalSize)
                expect(format).notTo(beNil())
                expect(format) == ImageFormat.OriginalSize
            }
        }
    }
}
