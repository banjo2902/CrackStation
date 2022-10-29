# CrackStation
## Author: PangFa Chou
###### 10/29/2022
###### version 1.0.0 

### INTRODUCTION
One of the biggest cybersecurity hole is password. For people who use smartphone or laptop or any high-technology devices, preventing unarthorized access of the devices by other people is a crucial problem since it might results in personal identity stolen and the loss of valuable data like bank account and work documents. Besides, hackers might use your device to  break the law, and it could put you in legal trouble.

To understand how the hackers manage to get your password, the best way is to acutally join their group! By using this library, you can learn how easy the hackers can crack your password if the password is too simple, even though the passwords have been hashed. Besides, you will also understand the importance of using complicated combinations of enumeric and alphabetic numbers and the reason why all the services prevent you using too easy password.

This library used pre-saved hashtable for mapping the hashed word. These tables store the mapping between password hashes and the correct password for that hash. Hash values are indexed so the database can be quickly searched for a given hash value.



## API Lists

### Public API

* **decrypt(shaHash: String)**: The function is used for decrpt hashed string. It is expected to receive the hashed string as the parameter in the argument. For example:
```
let hashedpass = "0e0bd9224cae3992bdb822021f1daed06a2e0a72"
let plainpassword = CrackStation().decrypt(shaHash: hashedpass)
```
