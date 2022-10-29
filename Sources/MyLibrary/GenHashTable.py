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
        hashedchar = hashlib.sha1(str[i].encode())
        result = hashedchar.hexdigest()
        hashmap[result] = str[i]

    return hashmap

with open('/Users/benchou/Documents/OSU/2022fall/CS561/hw5/MyLibrary/Sources/MyLibrary/sha1.json', 'w+') as f:
    str = "0123456789" + lowercaseAlphabets() + uppercaseAlphabets()
    map = json.dumps(sha1(str))
    f.write(map)
    # print(f.read())

