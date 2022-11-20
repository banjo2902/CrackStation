import Foundation
import CryptoKit


public class CrackStation: Decrypter {
    var lookupTable: Dictionary<String, String> = [:]
    
    required public init() {
        // fetch the hash table
        do{
            let path = Bundle.module.url(forResource: "HashTable", withExtension: "json")
            
            if let url = path {
                let data = try Data(contentsOf: url)
                let jsonResult = try JSONSerialization.jsonObject(with: data)
                if let table: Dictionary = jsonResult as? Dictionary<String, String> {
                    self.lookupTable = table
                } else {
                    self.lookupTable = [:]
                }
            } else {
                print("Error! Unable to unwrapped the path: HashTable.json")
            }
        } catch {
            print("Error! Unable to fetch the hash table: HashTable.json")
        }
    }
    
    // Either returns the cracked plain-text password
    // or, if unable to crack, then returns nil
    public func decrypt(shaHash: String) -> String? {
        return self.lookupTable[shaHash]
    }
    
}
