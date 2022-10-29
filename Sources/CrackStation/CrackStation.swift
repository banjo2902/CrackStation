import Foundation
import CryptoKit


public class CrackStation: Decrypter {
    required public init() { }
    static func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "sha1", withExtension: "json") else { return [:] }
        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }
    
    
    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    public func decrypt(shaHash: String) -> String? {
        print("shaHash = ", shaHash)
        let lookuptable = try! CrackStation.loadDictionaryFromDisk()
        var crackPass = ""
        
        if let val = lookuptable[shaHash] {
            crackPass = val
            print("crackPass = ", crackPass)
            return crackPass
            
        } else {
            return nil
        }
    }

}
