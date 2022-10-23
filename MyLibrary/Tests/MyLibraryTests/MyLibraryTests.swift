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
}
