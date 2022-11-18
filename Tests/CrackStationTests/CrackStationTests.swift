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
    
    func testDecryptwithSha1HashedPass() {
        // Given
        let myLibrary = CrackStation()
        let hashedpass = "ab29513ea1e486249c0b00022765275878ce7e01"
        
        // When
        let plainpassword = myLibrary.decrypt(shaHash: hashedpass)
        
        // Then
        XCTAssertEqual(plainpassword, "D!G")
    }
    
    func testDecryptwithSha256HashedPass() {
        // Given
        let myLibrary = CrackStation()
        let hashedpass = "e5bcba587c856aad400a3f3b9ef966c35c7480d5f5443c8992529f31951ecb70"
        
        // When
        let plainpassword = myLibrary.decrypt(shaHash: hashedpass)
        
        // Then
        XCTAssertEqual(plainpassword, "!gx")
    }
}
