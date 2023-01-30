//
//  main.swift
//  problem2
//
//  Created by Kuarnjo Taid on 25/01/23.
//
import Foundation

//
//// Access Shared Defaults Object
//let userDefaults = UserDefaults.standard
//
//// Read/Get Dictionary
//var strings: [String:String] = userDefaults.object(forKey: "myKey") as? [String:String] ?? [:]
//
//// Add Key-Value Pair to Dictionary
//strings["123"] = "Four"
//
//userDefaults.set(strings, forKey: "myKey")


//let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//
//let fileURL = URL(fileURLWithPath: "myFile", relativeTo: directoryURL).appendingPathExtension("txt")
//
//// Create data to be saved
//let myString = "Saving with FileManager is easy!"
//
//func saveFile() {
//    guard let data = myString.data(using: .utf8) else {
//        print("Unable to convert string to data")
//        return
//    }
//
//    // Save the data
//    do {
//     try data.write(to: fileURL)
//     print("File saved: \(fileURL.absoluteURL)")
//    } catch {
//     // Catch any errors
//     print(error.localizedDescription)
//    }
//
//}
//
//func readFile() {
//    do {
//        let text = try String(contentsOf: fileURL, encoding: .utf8)
//        print(text)
//    }
//    catch{
//        print(error.localizedDescription)
//    }
//}

//saveFile()
//readFile()
//

//
//struct User: Codable {
//    var fullName: String
//    var age: Int
//    var address: String
//    var rollNum: Int
//    var courses: [String]
//}

//var user1 = User(fullName: "name1", age: 20, address: "address1", rollNum: 1234, courses: ["A", "B"])
//
//var user2 = User(fullName: "name2", age: 21, address: "address2", rollNum: 1233, courses: ["A", "C"])
//
//var arr: [User] = [user1, user2]
//
//
//
//
//
//let encoder = JSONEncoder()
//encoder.outputFormatting = .prettyPrinted
//
//let data = try encoder.encode(arr)
////print(String(data: data, encoding: .utf8)!)
//
//let jsonDecoder = JSONDecoder()
//let users = try jsonDecoder.decode([User].self, from: data)
//
//
//arr = arr.sorted(by: {(user1: User, user2: User) -> Bool in
//    return user1.fullName > user2.fullName
//})


//
//var obj = User(fullName: "Kuarnjo", age: 21, address: "asd", rollNum: 123, courses: ["A"])
////
//let encoder = JSONEncoder()
//encoder.outputFormatting = .prettyPrinted
//
////let data = try encoder.encode(obj)
//////print(String(data: data, encoding: .utf8)!)
////
////
////var userDict: [String: String] = [String(obj.rollNum): String(data: data, encoding: .utf8)!]
//
//let userDefaults = UserDefaults.standard
//
////
////userDefaults.set(userDict, forKey: "newKey")
//
//// Read/Get Dictionary
//var strings: [String:String] = userDefaults.object(forKey: "newKey") as? [String:String] ?? [:]
//
//let jsonDecoder = JSONDecoder()
////let users = try jsonDecoder.decode([User].self, from: data)
//
//var user1 = try jsonDecoder.decode(User.self, from: strings["123"]!.data(using: .utf8)!)
//
//print(user1.courses)

enum Geda {
    case one(String)
    
    func case1(x: inout String){
        x = "12"
    }
}

var x = "a"

var y = Geda.one(x)

y.case1(x: &x)

print(x)
