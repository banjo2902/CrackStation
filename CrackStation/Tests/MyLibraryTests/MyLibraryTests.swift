import XCTest
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {
    func testExample() throws {
        // Given
        let lookuptable = try MyLibrary.loadDictionaryFromDisk()
        
        // When
        let answer = lookuptable["042dc4512fa3d391c5170cf3aa61e6a638f84342"]
        
        //
        XCTAssertEqual(answer, "i")
    }
    
    func testEncryptUsingSha1() {
        // Given
        let str = "a"
        
        // When
        let hashedstr = MyLibrary.encryptUsingSha1(from: str)
        
        //
        XCTAssertNotNil(hashedstr)
        XCTAssertEqual(hashedstr, "SHA1 digest: 86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        
    }
}
