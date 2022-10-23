import XCTest
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {
    func testExample() throws {
        // Given
        let lookuptable = try MyLibrary.loadDictionaryFromDisk()
        
        // When
        let answer = lookuptable["042dc4512fa3d391c5170cf3aa61e6a638f84342"]
        
        // Then
        XCTAssertEqual(answer, "i")
    }
    
    func testEncryptUsingSha1() {
        // Given
        let str = "a"
        
        // When
        let hashedstr = MyLibrary.encryptUsingSha1(from: str)
        
        // Then
        XCTAssertNotNil(hashedstr)
        XCTAssertEqual(hashedstr, "SHA1 digest: 86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        
    }
    
    func testCrack() {
        // Given
        let myLibrary = MyLibrary()
        let hashedpass = "13fbd79c3d390e5d6585a21e11ff5ec1970cff0c8efd86fb78a56a5145ed7739dcb00c78581c53757a38d8cbd20d9932ba948efaa364bb62651d5ad4"
        
        // When
        let plainpassword = myLibrary.crack(password: hashedpass)
        
        // Then
        XCTAssertNotNil(plainpassword)
        XCTAssertEqual(plainpassword, "ktv")
    }
    
}
