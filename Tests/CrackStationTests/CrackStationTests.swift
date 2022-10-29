import XCTest
@testable import CrackStation

final class CrackStationTests: XCTestCase {
    func testExample() throws {
        // Given
        let lookuptable = try CrackStation.loadDictionaryFromDisk()
        
        // When
        let answer = lookuptable["042dc4512fa3d391c5170cf3aa61e6a638f84342"]
        
        // Then
        XCTAssertEqual(answer, "i")
    }
    /*
    func testEncryptUsingSha1() {
        // Given
        let str = "a"
        
        // When
        let hashedstr = CrackStation.encryptUsingSha1(from: str)
        
        // Then
        XCTAssertNotNil(hashedstr)
        XCTAssertEqual(hashedstr, "SHA1 digest: 86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        
    }
    */
    
    func testDecrypt() {
        // Given
        let myLibrary = CrackStation()
        let hashedpass = "CS561"
        
        // When
        let plainpassword = myLibrary.decrypt(shaHash: hashedpass)
        
        // Then
        XCTAssertEqual(plainpassword, nil)
    }
    
}
