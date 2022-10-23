import Foundation
import CryptoKit

@available(macOS 10.15, *)
public class MyLibrary {
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
    
    static func encryptUsingSha1(from input: String) -> String {
        let inputData = Data(input.utf8)
        let output = Insecure.SHA1.hash(data: inputData)
        return output.description
    }
    
    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    public func crack(password: String) -> String? {
        let lookuptable = try! MyLibrary.loadDictionaryFromDisk()
        var crackPass = ""
        var letter = ""
        
        if password.count % 8 != 0 {
            //print("1")
            return nil
            
        } else {
            //print("password count = ", password.count)
            for index in stride(from: 0, to: password.count, by: 1) {
                letter += String(password[index])
                //print("index = ", index)
                //print("letter = ", letter)
                
                if letter.count == 40 {
                    if let val = lookuptable[letter] {
                        crackPass += val
                        letter = ""
                    } else {
                        //print("2")
                        return nil
                    }
                }
            }
        }
        
        if letter.count > 0 {
            //print(letter)
            //print("3")
            return nil
        }
        
        print("plainpass = ", crackPass)
        return crackPass
    }

}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

