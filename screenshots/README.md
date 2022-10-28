
## CS561 HW5 - CrackStation
## POCv1
###### Author: PangFa Chou


### What I build:

* __*func crack()*__: Function crack is used to crack hashed password and return plain-text password. Otherwise, return nil. Called it from:
    
        MyLibrary().crack(password: "your hashed password")
        
* __*func testCrack()*__: Function testCrack() is used as the unit test for testing crack(). You can call it from

        MyLibraryTest().testCrack()
        
    or run build and test the whole MyLibraryTest.swift
    
* __*genHashTable.py*__:
    This python program is used to generate SHA1 mapping dictionary: _**sha1.json**_. Unfortunately I am still working on its interoperability, so it is't called by any program in my package. 

