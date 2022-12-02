import Foundation
import CryptoKit


public class CrackStation: Decrypter {
    private let lookupTable: Dictionary<String, String>?
    
    // load the hash table
    private static func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "HashTable", withExtension: "json") else {
            return [:]
        }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }
    
    required public init() {
        self.lookupTable = try? CrackStation.loadDictionaryFromDisk()
    }
    
    // Either returns the cracked plain-text password
    // or, if unable to crack, then returns nil
    public func decrypt(shaHash: String) -> String? {
        return self.lookupTable?[shaHash]
    }
}
