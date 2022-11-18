import Foundation
import CryptoKit


public class CrackStation: Decrypter {
    var lookupTable: Dictionary<String, String> = [:]
    
    required public init?() {
        do{
            guard let path = Bundle.module.url(forResource: "sha1", withExtension: "json") else { return nil }
            
            let data = try Data(contentsOf: path)
            let jsonResult = try JSONSerialization.jsonObject(with: data)
            
            if let table: Dictionary = jsonResult as? Dictionary<String, String> {
                self.lookupTable = table
            } else {
                self.lookupTable = [:]
            }
        } catch {
            
        }
    }
    
    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    public func decrypt(shaHash: String) -> String? {
        return self.lookupTable[shaHash]
    }

}
