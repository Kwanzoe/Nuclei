//
//  Operations.swift
//  problem2
//
//  Created by Kuarnjo Taid on 30/01/23.
//


import Foundation


class Operate {
    
    func enterData() throws -> User {
        var fullName: String
        var age: Int?
        var address: String
        var rollNum: Int?
        var courses: [String]
        
        //Entering data
        print("Enter name: ")
        fullName = readLine()!
        print("Enter age: ")
        age = Int(readLine()!)
        guard age != nil else{
            throw InputError.invalidInput
        }
    
        
        print("Enter address: ")
        address = readLine()!
        
        print("Enter rollNum: ")
        rollNum = Int(readLine()!)!
        guard rollNum != nil else{
            throw InputError.invalidInput
        }
        
        repeat{
            print("Enter 4 to 6 courses (format :- course1,course2,course3: ")
            courses = readLine()!.split(separator: ",").map {String($0)}
        } while courses.count < 4 && courses.count <= 6
       
        
        
        return User(fullName: fullName, age: age!, address: address, rollNum: rollNum!, courses: courses)
        
    }
    
    func displayData(userDict: [String:String]) {
        var user: User
        var key: String
        
        print("Enter Roll number to print: ")
        
        repeat{
            key = readLine()!
        } while key == ""
        
        user = Utils.util.decode(userDict: userDict, key: key)!
        
        print("""
        --------------------------------------------------------------
         Name    Roll    Number     Age     Address     Courses
        --------------------------------------------------------------
        """)
        
        
        
        print("Name: \(user.fullName)", separator: "\t ")
        print("Age: \(user.age)", separator: "\t ")
        print("Address: \(user.address)", separator: "\t ")
        print("Roll Number: \(user.rollNum)", separator: "\t ")
        print("Courses: \(user.courses)", separator: "\t ")
        
    }
    
    func deleteData(userDict: inout [String:String]) {
        var key: String
        
        print("Enter roll num: ")
        repeat{
            key = readLine()!
        } while key == ""
        
        userDict[key] = nil
    }
    
    func saveData(userDict: [String:String]){
        Utils.util.userDefaults.set(userDict, forKey: "Users")
    }
    
}
