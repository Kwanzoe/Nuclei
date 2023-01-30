//
//  menu.swift
//  problem2
//
//  Created by Kuarnjo Taid on 29/01/23.
//

import Foundation

enum Options{
    case one([String:String])
    case two([String:String])
    case three([String:String], String)
    case four([String:String])
    
    
    func case1(userDict: inout [String:String]) {
        var fullName: String
        var age: Int
        var address: String
        var rollNum: Int
        var courses: [String]
        
        var userObj: User
        var encodedUser: String?
        
        print("Enter name: ")
        fullName = readLine()!
        print("Enter age: ")
        age = Int(readLine()!)!
        print("Enter address: ")
        address = readLine()!
        print("Enter rollNum: ")
        rollNum = Int(readLine()!)!
        print("Enter courses (format :- course1,course2,course3: ")
        courses = readLine()!.split(separator: ",").map {String($0)}
        
        
        userObj = User(fullName: fullName, age: age, address: address, rollNum: rollNum, courses: courses)
        
        encodedUser = Encoder(userObject: userObj).encode()
        
        //user dictionary reference
        userDict[String(rollNum)] = encodedUser
                
    }
    
    func case2(userDict: inout [String:String]) {
        var user: User
        var key: String
        
        print("Enter Roll number to print: ")
        repeat{
            key = readLine()!
        } while key == ""
        
        user = Decoder(userDict: userDict, key: key).decode()!
        
        print("Name: \(user.fullName)\n")
        print("Age: \(user.age)\n")
        print("Address: \(user.address)\n")
        print("Roll Number: \(user.rollNum)\n")
        print("Courses: \(user.courses)\n")
        
    }
    
    func case3(userDict: inout [String:String]) {
        var key: String
        
        print("Enter roll num: ")
        repeat{
            key = readLine()!
        } while key == ""
        
        userDict[key] = nil
    }
    
    func case4(userDict: inout [String:String]){
        var file = Files(userDict: userDict)
        file.save()
    }
    
}


class Menu: Essential{
    
    func menu(userDict: inout [String:String]) -> [String:String]? {
        
        print("""

    Choose from option 1 to 4 and press enter.

    1. Enter student details
    2. Display student data
    3. Enter roll number to delete
    4. Save
    5. Exit

"""
)
        var option: Options
        let tempOption = Int(readLine() ?? "0")
        

        switch tempOption{
        case 1:
            option = Options.one(userDict)
            option.case1(userDict: &userDict)
            
        case 2:
            option = Options.two(userDict)
            option.case1(userDict: &userDict)//
        case 3:
            
        default:
                print("f")
        }
        return nil
    }
    
    func main(){
        var userDict = getUserDict()
        var option: Int = 0
        
        repeat{
            var option = menu(userDict: &userDict)
            
            
            
//            switch option{
//            case 1:
//
//            }
//
        } while option != 5
        
        
    }
   
}
