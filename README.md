# CrackStation, version 1.1.3
A decrypter that cracks unsalted SHA1-hashed and SHA256-hashed passwords which the original password is composed of up-to-three characters.


### Overview
Hashing passwords is a common sense in software development. By doing that, users' risk of personal information is significanly reduced than those who store plain-text password in database since everyone who access the database could get them. However, it is still not guarantee to have 100% security in protecting your information. How? Doesn't hashing function claims to be uncrackable since it is one-way-hashed? How could some hackers still manage to crack your passwords? This is an implementation of one of the possible way that hackers crack your password: **using a giant mapping dictionary**. 

This library used pre-saved hashtable for mapping the hashed password. These tables store the mapping between hashed password and the correct plain-text password. Hash values are indexed so the database can be quickly searched for a given hash value.

### Mission Statement
One of the biggest cybersecurity holes is password. For people who use smartphone or laptop or any high-technology devices, preventing unarthorized access of the devices by other people is a crucial problem since it might results in personal identity stolen and the loss of valuable data like bank account and work documents. Besides, hackers might use your identity to  break the law, and it could put you in legal trouble.

To understand how the hackers manage to get your password, the best way is to acutally join their group! By using this library, you can learn how easy the hackers can crack your password, even though the passwords have been hashed. You can put any unsalted SHA1-hashed or SHA256-hashed password in the function to see if this program can actually decrypt the hashed passwords and return the original password to you.

## Installation
### Swift Package Manageer
The [Swift Package Manager](https://www.swift.org/package-manager.) is "a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies."

Once you have your Swift package set up, add CrackStation to the list of the dependencies in your `Package.swift` file:
```
dependencies: [
        .package(url: "git@github.com:banjo2902/CrackStation.git", from: "1.1.3")
    ]
```

## Usage
### The API
**init()**: Initialized the Decrypter and loading the hash table.

**decrypt(shaHash: String) -> String?**: Used for decrypting hashed string. 
* argument: 
    1. **shaHash**
        1. received the hashed password from call site.
        2. accepted type: **String**
* return type: **String**, or **nil** if unable to crack.

### An example

From the call site, you can do something like this:

```
let myLibrary = CrackStation()
let hashedpass = "e5bcba587c856aad400a3f3b9ef966c35c7480d5f5443c8992529f31951ecb70"
let plainpassword = myLibrary.decrypt(shaHash: hashedpass)

// test if the decrypt function return a valid plain-text password
XCTAssertEqual(plainpassword, "!gx")
```

## Author
### PangFa Chou
