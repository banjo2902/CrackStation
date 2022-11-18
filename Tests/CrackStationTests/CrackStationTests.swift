import XCTest
@testable import CrackStation

final class CrackStationTests: XCTestCase {
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
    
    func testDecryptwithRandomStr() {
        // Given
        let myLibrary = CrackStation()
        let hashedpass = "cs561hw9!"
        
        // When
        let plainpassword = myLibrary.decrypt(shaHash: hashedpass)
        
        // Then
        XCTAssertEqual(plainpassword, nil)
    }
}
