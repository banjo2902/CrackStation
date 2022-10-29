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
    
    func testDecrypt() {
        // Given
        let myLibrary = CrackStation()
        let hashedpass = ""
        
        // When
        let plainpassword = myLibrary.decrypt(shaHash: hashedpass)
        
        // Then
        XCTAssertEqual(plainpassword, nil)
    }
    
    /*func testEmptyString() throws {
        // Given
        let myLibrary = CrackStation()
        let password = ""
        let shaHash = myLibrary.encrypt(password)
        print("shaHash = ", shaHash)
        
        // When
        let crackedPassword = myLibrary.decrypt(shaHash: shaHash)

        // Then
        XCTAssertEqual(crackedPassword, nil)
    }
    */
}
