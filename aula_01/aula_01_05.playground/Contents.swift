import UIKit

var dic: [String : String] = ["name":"Rafael",
                              "email":"rafael@gmail.com"]
//print(dic["name"]!)

var dic1: [[String :Any]] = [["name":"Rafael",
                              "email":"rafael@gmail.com",
                              "age": 29],
                             ["name":"Rodrigo",
                              "email":"rodrigo@gmail.com",
                              "age": 29] ]
print(dic1[1]["name"]!)
