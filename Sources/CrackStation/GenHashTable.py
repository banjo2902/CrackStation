# lookup table generated program
import hashlib
import json

# Function to print the alphabet
def lowercaseAlphabets():
    lowercase = ""

    for c in range(97, 123):
        lowercase += chr(c)
  
    return lowercase
  
def uppercaseAlphabets():
    uppercase = ""

    for c in range(65, 91):
        uppercase += chr(c)
  
    return uppercase

def encrypt(hashmap: dict, password: str):
    # sha1 encrypt
    hashedchar = hashlib.sha1(password.encode())
    result = hashedchar.hexdigest()
    hashmap[result] = password
    # sha256 encrpt
    hashedchar = hashlib.sha256(password.encode())
    result = hashedchar.hexdigest()
    hashmap[result] = password

def sha1(str):
    hashmap = {}
    length = len(str)

    for i in range(length):
        encrypt(hashmap, str[i])
        
        for j in range(length):
            encrypt(hashmap, str[i] + str[j])

            for k in range(length):
                encrypt(hashmap, str[i] + str[j] + str[k])

    return hashmap

with open('./sha1.json', 'w+') as f:
    str = "0123456789?!" + lowercaseAlphabets() + uppercaseAlphabets()
    map = json.dumps(sha1(str))
    f.write(map)
    # print(f.read())