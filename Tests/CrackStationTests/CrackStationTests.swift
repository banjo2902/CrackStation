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
        let hashedpass = "0e0bd9224cae3992bdb822021f1daed06a2e0a72"
        
        // When
        let plainpassword = myLibrary.decrypt(shaHash: hashedpass)
        
        // Then
        XCTAssertEqual(plainpassword, "CS")
    }
    
}
