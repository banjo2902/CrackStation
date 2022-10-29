# lookup table generated program
import hashlib
import json

def lowercaseAlphabets():
    lowercase = ""

    for c in range(97, 123):
        lowercase += chr(c)
        # print(chr(c), end = " ");
  
    return lowercase
  
# Function to print the alphabet
# in upper case
def uppercaseAlphabets():
    uppercase = ""

    for c in range(65, 91):
        uppercase += chr(c)
        # print(chr(c), end = " ");
  
    return uppercase

def sha1(str):
    hashmap = {}
    # print(len(str))

    for i in range(len(str)):
        password = str[i]
        hashedchar = hashlib.sha1(password.encode())
        result = hashedchar.hexdigest()
        hashmap[result] = password
        
        for j in range(len(str)):
            password = str[i] + str[j]
            hashedchar = hashlib.sha1(password.encode())
            result = hashedchar.hexdigest()
            hashmap[result] = password

    return hashmap

with open('./sha1.json', 'w+') as f:
    str = "0123456789" + lowercaseAlphabets() + uppercaseAlphabets()
    map = json.dumps(sha1(str))
    f.write(map)
    # print(f.read())

